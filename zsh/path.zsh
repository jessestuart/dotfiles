#!/bin/bash

# Add the bins.
export PATH="$HOME/bin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH='/usr/local/sbin':$PATH

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

# =============
# ~* Secrets *~
# =============
test -e "$HOME/.secrets" && . "$HOME/.secrets"
