#!/bin/bash
# ===========================================================================
# Simple, hacky bootstrap script.
# For when you just want some essentials, & Ansible seems like overkill.
# TODO: Add "usage" printout.
# ===========================================================================

set -e

ARCH=amd64
USER=jesse
HOSTNAME=$(hostname)
echo "ARCH: $ARCH, USER: $USER"
if test -z "$ARCH"; then ARCH=arm64; fi
if test -z "$USER"; then USER=jesse; fi
USER_HOME=/home/$USER

if test -z $HOSTNAME; then
  echo "Please specify HOSTNAME as an env var."
  exit 1
fi

# TODO: Could pull latest releases of these from Github. Meh.
GO_VERSION="1.12.4"
DIFF_SO_FANCY_VERSION="1.2.5"
ANTIBODY_VERSION="4.1.1"

# =============================
# Some basic utility functions.
# =============================
function cmd_missing() {
  ! hash "$1" &>/dev/null
}
function print_header() {
  echo '============================'
  echo "$1"
  echo '============================'
}
function print_progress() {
  echo "-- $1"
}

sudo apt install -yq curl git

# ==========================
# Let's get this show goin'.
# Ensure some base debian deps are installed.
# ==========================
if cmd_missing sudo; then apt update -yq && apt install -yq sudo; fi
sudo apt update -yq
sudo apt install -yq \
  bash bash-completion curl git \
  htop make man neovim net-tools nfs-common \
  python3 python3-pip python3-setuptools tree \
  unzip vim wget zsh

print_header 'Creating non-root user...'
if ! (sudo useradd -G sudo -m -s /bin/bash $USER); then
  echo "User $USER already exists."
else
  echo "$USER:$USER" | sudo chpasswd
  echo "$USER ALL=(ALL) NOPASSWD:ALL" | sudo tee "/etc/sudoers.d/$USER"
  echo "NOTE:"
  echo "Please disable password-based SSH authentication, or update your default password."
fi

# ====================
# Golang installation.
# ====================
if cmd_missing go && ! test -d /usr/local/go; then
  print_header 'Installing Go...'
  curl -sL https://storage.googleapis.com/golang/go$GO_VERSION.linux-$ARCH.tar.gz | tar xz
  sudo mv go /usr/local
  print_progress 'golang installed successfully.'
fi

# ====================
# Docker installation.
# ====================
if cmd_missing docker; then
  print_header 'Installing Docker...'
  curl -fsSL get.docker.com | sudo sh
  sudo usermod -aG docker "$USER"
  print_progress 'Docker installed successfully.'
fi

# =======================
# Kubernetes installation
# =======================
if cmd_missing kubeadm; then
  sudo apt update && sudo apt-get install -yq apt-transport-https
  curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
  cat <<EOF >/etc/apt/sources.list.d/kubernetes.list
deb http://apt.kubernetes.io/ kubernetes-xenial main
EOF
  sudo apt update -yq
  sudo apt-get install -yq kubelet kubeadm kubectl
fi

# ======================
# Antibody installation.
# ======================
if cmd_missing antibody; then
  print_header 'Installing antibody...'
  antibody_arch=''
  case "$ARCH" in
  arm64)
    antibody_arch='arm64'
    ;;
  arm)
    antibody_arch="armv6"
    ;;
  amd64)
    antibody_arch='x86_64'
    ;;
  esac
  curl -sL https://github.com/getantibody/antibody/releases/download/v${ANTIBODY_VERSION}/antibody_Linux_${antibody_arch}.tar.gz | tar xz
  sudo mv antibody /usr/local/bin/
  print_progress 'antibody installed successfully.'
fi

# =================
# RCM installation.
# =================
if cmd_missing rcup; then
  print_header 'Installing rcm...'
  curl -sL https://thoughtbot.github.io/rcm/dist/rcm-1.3.1.tar.gz | tar xz
  pushd rcm-1.3.1
  ./configure && make && sudo make install
  popd
  rm -rf rcm*
  print_progress 'RCM installed successfully.'
fi

# ===========================
# diff-so-fancy installation.
# ===========================
if cmd_missing diff-so-fancy; then
  print_header 'Installing diff-so-fancy...'
  test -d "$USER_HOME/bin" || sudo mkdir "$USER_HOME/bin"
  cd "$USER_HOME/bin"
  sudo wget https://github.com/so-fancy/diff-so-fancy/archive/v${DIFF_SO_FANCY_VERSION}.zip
  sudo unzip v${DIFF_SO_FANCY_VERSION}
  sudo cp -rf diff-so-fancy-${DIFF_SO_FANCY_VERSION}/ "$USER_HOME"/bin/diff-so-fancy
  sudo rm -rf v${DIFF_SO_FANCY_VERSION}
  print_progress 'diff-so-fancy installed successfully.'
fi

# ==========================
# Unleash the ~* dotfiles *~
# ==========================
print_header 'Installing dotfiles...'
cd "$USER_HOME"
sudo chown -R "$USER:" "$USER_HOME"
if ! test -d "$USER_HOME"/dotfiles; then
  git clone https://github.com/jessestuart/dotfiles
fi
sudo chown -R "$USER:" "$USER_HOME"
# pushd dotfiles && git stash save && git pull && git stash pop && popd
rcup -d "$USER_HOME/dotfiles"
sudo chsh -s $(which zsh) $USER
print_progress 'Finished syncing dotfiles.'

if ! test -d "$USER_HOME/.config/nvim/plugged"; then
  print_header 'Installing nvim plugins...'
  curl -fLo "$USER_HOME/.local/share/nvim/site/autoload/plug.vim" --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  sudo chown -R "$USER:" "$USER_HOME"
  yes | nvim "+PlugInstall --sync" +qa
fi

if ! test -z $HOSTNAME && (hash hostnamectl &>/dev/null); then
  print_header 'Updating hostname.'
  sudo hostnamectl set-hostname "$HOSTNAME"
  sudo hostname "$HOSTNAME"
fi

# ==============
# ARM64-Specific
# ==============
if test "$(uname -m)" == 'aarch64'; then
  if cmd_missing exa; then
    print_header 'Installing exa...'
    wget 'arm64.j3s.co/exa'
    sudo mv exa /usr/local/bin/
    libhttp_package=$(apt-cache search libhttp-parser2 --names-only | head -n1 | awk '{print $1}')
    sudo apt install -yq "$libhttp_package"
    # exa expects v2.1 of the `libhttp-parser` package.
    if ! (echo $libhttp_package | grep -q '2.1'); then
      sudo ln -s /usr/lib/aarch64-linux-gnu/libhttp_parser.so.2.7.1 \
        /usr/lib/aarch64-linux-gnu/libhttp_parser.so.2.1
    fi
  fi

  if cmd_missing fd; then
    print_header 'Installing fd...'
    wget 'arm64.j3s.co/fd'
    sudo mv fd /usr/local/bin/
  fi

  if cmd_missing rg; then
    print_header 'Installing rg...'
    wget 'arm64.j3s.co/rg'
    sudo mv rg /usr/local/bin/
  fi
fi

echo "Setup complete -- start a new shell to initialize ZSH plugins."
