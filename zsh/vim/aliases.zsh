#!/usr/bin/env bash
# ============
# Vim aliases.
# ============
if (hash nvim &>/dev/null); then
  export EDITOR='nvim'
elif (hash vim &>/dev/null); then
  export EDITOR='vim'
else
  export EDITOR='vi'
fi

alias cdv="cd ~/.config/nvim"
alias v="$EDITOR"
alias vgit="$EDITOR ~/.gitconfig"
alias vham="$EDITOR ~/.hammerspoon/init.lua"
alias vi="$EDITOR"
alias via="$EDITOR ~/.zsh/aliases.zsh"
alias viagit="$EDITOR ~/.zsh/git/aliases.zsh"
alias vianti="vi ~/dotfiles/zsh/antibody"
alias vici="$EDITOR .circleci/config.yml"
alias vif="$EDITOR ~/.zsh/functions.zsh"
alias vimake="$EDITOR Makefile"
alias vimap="$EDITOR ~/.config/nvim/mappings.vimrc"
alias vip="$EDITOR ~/.config/nvim/plugins.vimrc"
alias vipale="$EDITOR ~/.config/nvim/ale.vimrc"
alias vipc="$EDITOR ~/.config/nvim/plugins-config.vimrc"
alias vir="$EDITOR README.md"
alias vis="$EDITOR ~/.secrets"
alias vissh="$EDITOR ~/.ssh/config"
alias vitodo="$EDITOR TODO.md"
alias viv="$EDITOR ~/.zsh/vim/aliases.zsh"
alias vpk="$EDITOR package.json"
alias vprez="$EDITOR ~/.zpreztorc"
alias vt="$EDITOR ~/.tmux.conf"
alias vz="$EDITOR ~/.zsh/zshrc"
