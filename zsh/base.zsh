#!/bin/bash
# Use bash in the shebang to get `shellformat` support in vim.

# =====================================
# Jesse does dotfiles: The ZSH edition.
# =====================================

# --------------------------------------
# Base ZSH configuration.
# --------------------------------------
# Source Prezto.
ZPREZTO_INIT="${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
test -e "$ZPREZTO_INIT" && . "$ZPREZTO_INIT"
unset ZPREZTO_INIT

# Enable "fast deletion" of nested folder structures.
# @see https://unix.stackexchange.com/questions/277203/whats-the-fastest-way-to-remove-all-files-subfolders-in-a-directory
autoload zsh/files

# Get pure. 🙏
autoload -U promptinit; promptinit
prompt pure

# Reload aliases in case any got clobbered by zprezto.
source "$HOME/.zsh/aliases.zsh"

# --------------------------------------
# Miscellany.
# --------------------------------------

# Support for signing git commits w/ GPG.
export GPG_TTY=$(tty)

# Allow completing of the remainder of a command -- super useful!
bindkey "^N" insert-last-word

zle -N zle-line-init
zle -N zle-keymap-select
export KEYTIMEOUT=1

# Set right-hand prompt via zsh's RPROMPT.
if [ -n "$TMUX" ]; then
  export RPROMPT='%F$(test -e .gtm && gtm status -total-only -long-duration)'
fi
