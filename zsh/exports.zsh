#!/usr/bin/env bash

export TERM='xterm-256color'

# Enable persistent REPL history for `node`.
export NODE_REPL_HISTORY=~/.node_history
# Allow 32³ entries; the default is 1000.
export NODE_REPL_HISTORY_SIZE='32768'
# Use sloppy mode by default, matching web browsers.
export NODE_REPL_MODE='sloppy'

# Make Python use UTF-8 encoding for output to stdin, stdout, and stderr.
export PYTHONIOENCODING='UTF-8'

# Increase ZSH history size. Allow 32³ entries; the default is 500.
# export HISTSIZE='32768'
# export HISTFILESIZE="${HISTSIZE}"
# Omit duplicates and commands that begin with a space from history.
# export HISTCONTROL='ignoreboth'
export HISTTIMEFORMAT="%h %d %H:%M:%S> "
export HIST_FIND_NO_DUPS=true

# Prefer US English and use UTF-8.
export LANG='en_US.UTF-8'
export LC_ALL='en_US.UTF-8'

# Highlight section titles in manual pages.
if ! hash vimpager &>/dev/null; then
  export LESS_TERMCAP_mb=$'\e[1;32m'
  export LESS_TERMCAP_md=$'\e[1;32m'
  export LESS_TERMCAP_me=$'\e[0m'
  export LESS_TERMCAP_se=$'\e[0m'
  export LESS_TERMCAP_so=$'\e[01;33m'
  export LESS_TERMCAP_ue=$'\e[0m'
  export LESS_TERMCAP_us=$'\e[1;4;31m'
fi

# # Don’t clear the screen after quitting a manual page.
# export MANPAGER='less -X'

export MANPAGER="nvim -c 'set ft=man' -"

export HOMEBREW_CASK_OPTS="--appdir=/Applications"

export PYENV_ROOT="$HOME/.pyenv"

###
# ANSIBLE
###
export EC2_INI_PATH=/etc/ansible/ec2.ini
# Sorry `cowsay` -- turn this noisy shit off.
export ANSIBLE_NOCOWS=1

export TODO_DB_PATH="$HOME/Dropbox/Apps/todo/todo.json"

export PURE_PROMPT_SYMBOL="λ"

# For Timing.app
export PROMPT_TITLE='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/~}\007"'
export PROMPT_COMMAND="${PROMPT_TITLE}; ${PROMPT_COMMAND}"

# if hash vimpager &>/dev/null; then
#   export PAGER="$(which vimpager)"
#   alias less=$PAGER
#   alias zless=$PAGER
# fi

# if hash nvim &>/dev/null; then
#   export PAGER="nvim -R"
# fi

export HOWDOI_COLORIZE=1

export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=245"

export CHEATPATH="$HOME/github/rstacruz/cheatsheets:$CHEATPATH"

export PATH="/usr/local/opt/curl/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/curl/lib"
export CPPFLAGS="-I/usr/local/opt/curl/include"
export PKG_CONFIG_PATH="/usr/local/opt/curl/lib/pkgconfig"

export HOMEBREW_PREFIX="/usr/local"
export HOMEBREW_CELLAR="/usr/local/Cellar"
export HOMEBREW_REPOSITORY="/usr/local/Homebrew"
export MANPATH="/usr/local/share/man:$MANPATH"
export INFOPATH="/usr/local/share/info:$INFOPATH"

export GROOVY_TURN_OFF_JAVA_WARNINGS=1

export PATH="$HOME/.cargo/bin:$PATH"

export PATH="$HOME/.poetry/bin:$PATH"

# zlib
export LDFLAGS="-L/usr/local/opt/zlib/lib"
export CPPFLAGS="-I/usr/local/opt/zlib/include"
export PKG_CONFIG_PATH="/usr/local/opt/zlib/lib/pkgconfig"

PATH=$(echo "$PATH" | awk -v RS=':' -v ORS=":" '!a[$1]++')
