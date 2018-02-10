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

# Get pure. 🙏
autoload -Uz promptinit; promptinit
prompt pure

# --------------------------------------
# Miscellany.
# --------------------------------------

# Support for signing git commits w/ GPG.
export GPG_TTY="$(tty)"

# Use Ctrl+P / Ctrl+N to navigate through history, à l'emacs.
bindkey "^N" down-line-or-search
bindkey "^P" up-line-or-search
bindkey '^?' backward-delete-char
bindkey '^H' backward-delete-char
bindkey '^W' backward-kill-word

# zle -N zle-line-init
# zle -N zle-keymap-select
# export KEYTIMEOUT=1

# Set right-hand prompt via zsh's RPROMPT.
if [ -n "$TMUX" ]; then
  export RPROMPT='%F$(test -e .gtm && gtm status -total-only -long-duration)'
fi
