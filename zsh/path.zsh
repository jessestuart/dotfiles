#!/usr/bin/env zsh

# Add the bins.
export PATH="/sbin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/sbin:$PATH"

# Couple special `bin` directories for [dash](https://github.com/IFTTT/dash)
# + some nifty commands from [Zach Holman](https://github.com/holman/dotfiles)
export PATH="$HOME/bin/:$PATH"
export PATH="$HOME/bin/dash:$PATH"
export PATH="$HOME/bin/holman:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.bin/:$PATH"
export PATH="$HOME/bin/ykpers/bin:$PATH"

# MongoDB
export MONGO_PATH=/usr/local/mongodb
export PATH=$PATH:$MONGO_PATH/bin

# Python.
export PATH="/usr/local/opt/python/libexec/bin:$PATH"

# Rust.
export PATH="$PATH:$HOME/.cargo/bin"

# export PATH="$PATH:~/dotfiles/**/*.sh"

export PATH="/usr/local/opt/gnu-tar/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/make/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/findutils/libexec/gnubin:$PATH"

export PATH="$HOME/github/emacs/src:$PATH"
export PATH="$HOME/.emacs.d/bin:$PATH"

export PATH="/opt/etcher:$PATH"

if [ "$(uname -s | grep -q 'Linux')" -eq '0' ]; then
  if test -e "$HOME/go"; then
    export GOPATH="$HOME/go"
  elif test -e "/mnt/data/go"; then
    export GOPATH="/mnt/data/go"
  fi
  export PATH=$PATH:/usr/local/go/bin:$HOME/go/bin:/mnt/data/go/bin
  export PATH=$PATH:/home/linuxbrew/.linuxbrew/bin
  export PATH=$PATH/var/home/linuxbrew/.linuxbrew/bin
fi

if [ "$(uname -s)" = "Darwin" ]; then
  export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
  export PATH="/usr/local/opt/coreutils/libexec/gnuman:$PATH"
  export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
  export PATH="/usr/local/opt/gnu-tar/libexec/gnubin:$PATH"
fi

export PATH="$PATH:$HOME/bin/etcher/"

export PATH="$HOME/bin/diff-so-fancy:$PATH"

export PATH="$HOME/.gem/ruby/2.5.0/bin:$PATH"
export PATH="$HOME/.gem/ruby/2.6.0/bin:$PATH"
export PATH="/usr/local/lib/ruby/gems/2.5.0/gems/bin:$PATH"
export PATH="/usr/local/lib/ruby/gems/2.6.0/gems/bin:$PATH"
export PATH="/usr/local/lib/ruby/gems/2.6.0/bin:$PATH"
# export PATH="/usr/local/lib/ruby/gems/2.6.0/bin:$PATH"
export PATH="/usr/local/opt/ruby/bin:$PATH"

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH="$HOME/bin/sonar-scanner/bin:$PATH"
# export PATH="$(yarn global bin):$PATH"

# export ANDROID_HOME=$HOME/Library/Android/sdk
# PATH=$PATH:$ANDROID_HOME/emulator
# PATH=$PATH:$ANDROID_HOME/tools
# PATH=$PATH:$ANDROID_HOME/platform-tools
# PATH=$PATH:$ANDROID_HOME/tools/bin

# =============
# ~* Secrets *~
# =============
test -e "$HOME/.secrets" && . "$HOME/.secrets"

export PATH="/usr/local/opt/ruby/bin:$PATH"
export PATH="/usr/local/lib/ruby/gems/2.6.0/bin/bundle:$PATH"

export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

export PATH=/opt/kata/bin:$PATH
export PATH=/home/linuxbrew/.linuxbrew/opt/python/libexec/bin:$PATH
export PATH=/usr/local/nvim/bin:$PATH
export PATH=/snap/bin:$PATH

export PATH=$PATH:~/.kube/plugins/jordanwilson230

export PATH="/usr/local/opt/mozjpeg/bin:$PATH"

export PATH="/usr/local/opt/libxml2/bin:$PATH"

# export PATH="/usr/local/opt/sqlite/bin:$PATH"

export PATH="/opt/rocm/bin:/opt/rocm/profiler/bin:/opt/rocm/opencl/bin/x86_64:$PATH"

# export PATH="/Library/Developer/CommandLineTools/usr/bin:$PATH"
export PATH="~/Applications/Xcode.app/Contents/Developer/usr/bin/:$PATH"

# (Usually) prefer /usr/local/bin.
export PATH="/usr/local/bin:$PATH"

# Yarn / NPM.
export PATH="/usr/local/opt/yarn/bin:$PATH"
export PATH="$HOME/.npm-global/bin:$PATH"
export PATH="/usr/local/node/bin:$PATH"
export PATH="$HOME/.pyenv/versions/3.8.0/bin:$PATH"
export PATH="/usr/local/nvim/bin:$PATH"

typeset -aU path
