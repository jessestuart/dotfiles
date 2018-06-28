#!/bin/bash
# ===========================================================================
# Simple, hacky bootstrap script.
# For when you just want some essentials, & Ansible seems like overkill.
# TODO: Add "usage" printout.
# ===========================================================================

set -e

ARCH=$ARCH
USER=$USER
HOSTNAME=$HOSTNAME
echo "ARCH: $ARCH, USER: $USER"
if test -z "$ARCH"; then ARCH=arm64; fi
if test -z "$USER"; then USER=jesse; fi
USER_HOME=/home/$USER

# TODO: Could pull latest releases of these from Github. Meh.
GO_VERSION="1.10.3"
DIFF_SO_FANCY_VERSION="1.2.0"
ANTIBODY_VERSION="3.5.1"

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

# ==========================
# Let's get this show goin'.
# Ensure some base debian deps are installed.
# ==========================
if cmd_missing sudo; then apt update -yq && apt install -yq sudo; fi
sudo apt update -yq
sudo apt install -yq bash bash-completion curl git htop make man neovim tree unzip vim wget zsh

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
fi

# ====================
# Docker installation.
# ====================
if cmd_missing docker; then
  print_header 'Installing Docker...'
  curl -fsSL get.docker.com | sudo sh
  sudo usermod -aG docker "$USER"
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
  sudo cp -r diff-so-fancy-${DIFF_SO_FANCY_VERSION}/ "$USER_HOME"/bin/diff-so-fancy
  sudo rm -rf v${DIFF_SO_FANCY_VERSION}
fi

if ! test -d "$USER_HOME/.config/nvim/plugged"; then
  sudo curl -fLo "$USER_HOME/.local/share/nvim/site/autoload/plug.vim" --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

# ==========================
# Unleash the ~* dotfiles *~
# ==========================
if ! test -d "$USER_HOME"/dotfiles; then
  print_header 'Installing dotfiles...'
  cd "$USER_HOME"
  sudo git clone https://github.com/jessestuart/dotfiles
  sudo rcup -d dotfiles
  sudo chown -R "$USER:" "$USER_HOME"
  sudo chsh -s /bin/zsh $USER
fi

if ! test -z $HOSTNAME; then
  sudo hostnamectl set-hostname "$HOSTNAME"
  sudo hostname "$HOSTNAME"
fi

echo "Setup complete -- start a new shell to initialize ZSH plugins."
# sudo ln -s /usr/lib/aarch64-linux-gnu/libhttp_parser.so.2.7.1 /usr/lib/aarch64-linux-gnu/libhttp_parser.so.2.1
