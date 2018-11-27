#!/usr/bin/env bash

load_editor

# ============
# Vim aliases.
# ============
alias v="$EDITOR"
alias vi.="$EDITOR ."
alias vi="$EDITOR"

# ===========================
# Shortcuts to edit dotfiles.
# ===========================

alias via="$EDITOR ~/.zsh/aliases.zsh"
alias viad="$EDITOR ~/.zsh/docker/aliases.zsh"
alias viagit="$EDITOR ~/.zsh/git/aliases.zsh"
alias viak="$EDITOR ~/.zsh/kubernetes/aliases.zsh"
alias vianti="vi ~/dotfiles/zsh/antibody"
alias vidk="$EDITOR ~/dotfiles/zsh/docker"
alias vif="$EDITOR ~/.zsh/functions.zsh"
alias vigitconfig="$EDITOR ~/.gitconfig"
alias viham="$EDITOR ~/.hammerspoon/init.lua"
alias vik="$EDITOR ~/.zsh/kubernetes"
alias vikf="$EDITOR ~/.zsh/kubernetes/functions.zsh"
alias vipath="$EDITOR ~/.zsh/path.zsh"
alias viv="$EDITOR ~/.zsh/vim/aliases.zsh"
alias vt="$EDITOR ~/.tmux.conf"
alias vz="$EDITOR ~/.zsh/zshrc"

# ===================================
# Vim-specific configuration aliases.
# ===================================

alias cdv="cd ~/.config/nvim"
alias vimap="$EDITOR ~/.config/nvim/mappings.vimrc"
alias vip="$EDITOR ~/.config/nvim/plugins.vimrc"
alias vipale="$EDITOR ~/.config/nvim/ale.vimrc"
alias vipc="$EDITOR ~/.config/nvim/plugins-config.vimrc"

# =================================================================
# Miscellaneous shortcuts -- quickly pulling up package.json, or a
# Makefile, CI config, etc.
# =================================================================

alias vici="$EDITOR .circleci/config.yml"
alias vihost="sudo $EDITOR /etc/hosts"
alias vimake="$EDITOR Makefile"
alias vir="$EDITOR README.md"
alias visec="$EDITOR ~/.secrets"
alias vissh="$EDITOR ~/.ssh/config"
alias vitodo="$EDITOR TODO.md"
alias vm="$EDITOR Makefile"
