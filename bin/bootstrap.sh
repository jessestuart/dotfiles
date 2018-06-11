#!/bin/bash
# Simple, hacky bootstrap script; for when you just want the bare essentials,
# and Ansible is overkill.
ARCH=arm64
USER=jesse
GO_VERSION="1.10.2"
DIFF_SO_FANCY_VERSION="1.2.0"

echo '========================='
echo 'Creating non-root user...'
echo '========================='
sudo useradd -G sudo -m -s /bin/bash $USER
echo "$USER:$USER" | sudo chpasswd
echo "NOTE:"
echo "Please disable password-based SSH authentication, or update your default password."
echo "$USER ALL=(ALL) NOPASSWD:ALL" | sudo tee "/etc/sudoers.d/$USER"

sudo apt update -yq
sudo apt install -yq zsh make unzip tree htop

echo '================'
echo 'Installing Go...'
echo '================'
if ! (hash go&>/dev/null); then
  curl -sL https://storage.googleapis.com/golang/go$GO_VERSION.linux-$ARCH.tar.gz | tar xz
  sudo mv go /usr/local
fi

echo '======================'
echo 'Installing Docker...'
echo '======================'
curl -fsSL get.docker.com | sudo sh
sudo usermod -aG docker "$USER"

echo '======================'
echo 'Installing antibody...'
echo '======================'
if ! (hash antibody&>/dev/null); then
  antibody_arch=''
  case "$ARCH" in
    arm64)
      antibody_arch='aarch64'
      ;;
    arm)
      antibody_arch="armv6"
      ;;
    amd64)
      antibody_arch='x86_64'
      ;;
  esac
  curl -sL https://github.com/getantibody/antibody/releases/download/3.5.0/antibody_Linux_${antibody_arch}.tar.gz | tar xz
  sudo mv antibody /usr/local/bin
fi

echo '======================'
echo 'Installing rcm...'
echo '======================'
if ! (hash rcup&>/dev/null); then
  curl -sL https://thoughtbot.github.io/rcm/dist/rcm-1.3.1.tar.gz | tar xz
  pushd rcm-1.3.1
  ./configure && make && sudo make install
  popd
  rm -rf rcm*
fi

echo '======================'
echo 'Installing diff-so-fancy...'
echo '======================'
wget https://github.com/so-fancy/diff-so-fancy/archive/v${DIFF_SO_FANCY_VERSION}.zip
unzip v${DIFF_SO_FANCY_VERSION}
cp -r diff-so-fancy-${DIFF_SO_FANCY_VERSION}/ $HOME/bin/diff-so-fancy
rm -rf v${DIFF_SO_FANCY_VERSION}

echo '======================'
echo 'Installing dotfiles...'
echo '======================'
cd $HOME
git clone https://github.com/jessestuart/dotfiles
rcup -d dotfiles
sudo chown -R "$USER:" $HOME
# sudo ln -s /usr/lib/aarch64-linux-gnu/libhttp_parser.so.2.7.1 /usr/lib/aarch64-linux-gnu/libhttp_parser.so.2.1
sudo chsh -s /bin/zsh $USER
zsh
source $HOME/.zshrc
