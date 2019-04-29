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

if cmd_missing sudo; then
  print_progress "sudo is not installed; installed now as root."
  apt update -yq && apt install -yq sudo
fi

# ===========================================
# Let's get this show goin'.
# Ensure some base debian deps are installed.
# ===========================================
print_header "Installing dependencies..."
sudo apt-get update -yq
sudo apt-get install -yq \
  bash bash-completion curl git \
  htop make man neovim net-tools nfs-common \
  python3 python3-pip python3-setuptools tree \
  unzip vim wget zsh

print_header 'Creating non-root user...'
if ! (sudo useradd -G sudo -m -s /bin/bash $USER); then
  echo "User $USER already exists."
else
  echo "$USER:$USER" | sudo chpasswd
  echo "NOTE:"
  echo "Please disable password-based SSH authentication, or update your default password."
fi
print_progress "Adding $USER to sudoers group..."
echo "$USER ALL=(ALL) NOPASSWD:ALL" | sudo tee "/etc/sudoers.d/$USER"

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
  sudo chown -R "$USER" "$USER_HOME"
  nvim "+PlugInstall --sync" +qa
fi

if ! test -z $HOSTNAME && (hash hostnamectl &>/dev/null); then
  print_header 'Updating hostname.'
  sudo hostnamectl set-hostname "$HOSTNAME"
  sudo hostname "$HOSTNAME"
fi

print_header "Setup complete 🎉"
print_progress "Start a new shell to initialize ZSH plugins."S
