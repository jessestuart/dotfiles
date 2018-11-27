#!/bin/bash
# ^ Use bash in the shebang to get `shellformat` support in vim.

# --------------------------------------
# Base ZSH configuration.
# --------------------------------------
# Get ya' vim on.
bindkey -v

# Enable "fast deletion" of nested folder structures.
# @see https://unix.stackexchange.com/questions/277203/whats-the-fastest-way-to-remove-all-files-subfolders-in-a-directory
autoload zsh/files

autoload zsh/zle

# Get pure. 🙏
autoload -Uz promptinit
promptinit

# Avoid "file/directory already exists" warnings.
# I know what I'm doing. 🔥
set clobber

# Immediately insert first possible match.
setopt MENU_COMPLETE

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# --------------------------------------
# Miscellany.
# --------------------------------------

# Use Ctrl+P / Ctrl+N to navigate through history, à l'emacs.
bindkey "^N" down-line-or-search
bindkey "^P" up-line-or-search
bindkey '^W' backward-kill-word

# zle -N zle-line-init
# zle -N zle-keymap-select
export KEYTIMEOUT=1

# Set right-hand prompt via zsh's RPROMPT.
if [ -n "$TMUX" ]; then
  export RPROMPT='%F$(test -e .gtm && gtm status -total-only -long-duration)'
fi

setopt autopushd pushdminus pushdsilent pushdtohome

zle-keymap-select() {
  if [ "$TERM" = "xterm-256color" ]; then
    if [ $KEYMAP = vicmd ]; then
      # the command mode for vi
      echo -ne "\e[2 q"
    else
      # the insert mode for vi
      echo -ne "\e[4 q"
    fi
  fi
}
