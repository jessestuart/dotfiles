#!/bin/bash
ARCH=arm64
GO_VERSION="1.10.2"

sudo apt update -yq
sudo apt install -yq zsh make unzip

echo '================'
echo 'Installing Go...'
echo '================'
# if ! (hash go&>/dev/null); then
	# curl -sL https://storage.googleapis.com/golang/go$GO_VERSION.linux-$ARCH.tar.gz | tar xz
	# sudo mv go /usr/local
# fi

echo '======================'
echo 'Installing antibody...'
echo '======================'
if ! (hash antibody&>/dev/null); then
	curl -sL https://github.com/getantibody/antibody/releases/download/v3.4.5/antibody_Linux_x86_64.tar.gz | tar xz
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
echo 'Installing dotfiles...'
echo '======================'
cd /home/pi
# git clone https://github.com/jessestuart/dotfiles /home/pi/dotfiles
rcup -d /home/pi/dotfiles
chown -R pi: /home/pi
# sudo apt install -yq zsh unzip # libhttp-parser2
sudo ln -s /usr/lib/aarch64-linux-gnu/libhttp_parser.so.2.7.1 /usr/lib/aarch64-linux-gnu/libhttp_parser.so.2.1
sudo chsh -s /bin/zsh pi
zsh
source $HOME/.zshrc
