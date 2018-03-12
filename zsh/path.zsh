#!/bin/bash

# Add the bins.
export PATH="$HOME/bin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/sbin:$PATH"
export PATH="/sbin:$PATH"

# Couple special `bin` directories for [dash](https://github.com/IFTTT/dash)
# + some nifty commands from [Zach Holman](https://github.com/holman/dotfiles)
export PATH="$HOME/bin/dash:$PATH"
export PATH="$HOME/bin/holman:$PATH"

# MongoDB
export MONGO_PATH=/usr/local/mongodb
export PATH=$PATH:$MONGO_PATH/bin

# Python.
export PATH="/usr/local/opt/python/libexec/bin:$PATH"

# Yarn / NPM.
export PATH="/usr/local/opt/yarn/bin:$PATH"
export PATH="$HOME/.npm-global/bin:$PATH"

# Rust.
export PATH="$PATH:$HOME/.cargo/bin"

export PATH="$PATH:~/dotfiles/**/*.sh"

export PATH="/usr/local/opt/gnu-tar/libexec/gnubin:$PATH"

# export PATH="/Users/jestuart/bin/miniconda3/bin:$PATH"

export PATH="/usr/local/opt/make/libexec/gnubin:$PATH"

export PATH="$HOME/github/emacs/src:$PATH"
export PATH="$HOME/.emacs.d/bin:$PATH"

if [ $(uname -s) = 'GNU/Linux' ]; then
  export GOPATH=$HOME/go
  export GOROOT=/usr/local/go
  export PATH=$PATH:/usr/local/go/bin:~/go/bin
  export PATH=$PATH:/home/linuxbrew/.linuxbrew/bin
  export PATH=$PATH/var/home/linuxbrew/.linuxbrew/bin
fi

# export PATH="$HOME/dev/heketi-client/bin:$PATH"
export PATH="$HOME/bin/heketi-client/bin:$PATH"

# =============
# ~* Secrets *~
# =============
test -e "$HOME/.secrets" && . "$HOME/.secrets"
