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

# Yarn.
export PATH="$PATH:/usr/local/opt/yarn/bin"

# Rust.
export PATH="$PATH:$HOME/.cargo/bin"

export PATH="$PATH:~/dotfiles/**/*.sh"

# =============
# ~* Secrets *~
# =============
test -e "$HOME/.secrets" && . "$HOME/.secrets"
