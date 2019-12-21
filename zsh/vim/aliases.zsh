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

alias via="$EDITOR ~/dotfiles/zsh/aliases.zsh"
alias viad="$EDITOR ~/dotfiles/zsh/docker/aliases.zsh"
alias viagit="$EDITOR ~/dotfiles/zsh/git/aliases.zsh"
alias viak="$EDITOR ~/dotfiles/zsh/kubernetes/aliases.zsh"
alias vianti="$EDITOR ~/dotfiles/zsh/antibody.conf"
alias viaweb="$EDITOR ~/dotfiles/zsh/webdev/aliases.zsh"
alias viz="$EDITOR ~/dotfiles/zsh"
alias vidk="$EDITOR ~/dotfiles/zsh/docker"
alias vidot="$EDITOR ~/dotfiles"
alias vif="$EDITOR ~/dotfiles/zsh/functions.zsh"
alias vigitconfig="$EDITOR ~/.gitconfig"
alias viham="$EDITOR ~/.hammerspoon/init.lua"
alias vik="$EDITOR ~/dotfiles/zsh/kubernetes/"
alias vikf="$EDITOR ~/dotfiles/zsh/kubernetes/functions.zsh"
alias vipath="$EDITOR ~/dotfiles/zsh/path.zsh"
alias vival="$EDITOR ~/dotfiles/zsh/vim/aliases.zsh"
alias vt="$EDITOR ~/.tmux.conf"
alias vz="$EDITOR ~/dotfiles/zsh/zshrc"
alias viexports="$EDITOR ~/dotfiles/zsh/exports.zsh"

# ===================================
# Vim-specific configuration aliases.
# ===================================

alias cdv="cd ~/.config/nvim"
alias viv="$EDITOR ~/dotfiles/config/nvim"
alias vimap="$EDITOR ~/dotfiles/config/nvim/mappings.vimrc"
alias vip="$EDITOR ~/dotfiles/config/nvim/plugins.vimrc"
alias vipale="$EDITOR ~/dotfiles/config/nvim/ale.vimrc"
alias vipc="$EDITOR ~/dotfiles/config/nvim/plugins-config.vimrc"

# =================================================================
# Miscellaneous shortcuts -- quickly pulling up package.json, or a
# Makefile, CI config, etc.
# =================================================================

alias vici="$EDITOR .circleci/config.yml"
alias vihost="sudo $EDITOR /etc/hosts"

# Makefile aliases
alias vimake="$EDITOR Makefile"
alias vimk="$EDITOR Makefile"
alias vm="$EDITOR Makefile"

alias visec="$EDITOR ~/.secrets"
alias vissh="$EDITOR ~/.ssh/config"
alias vitodo="$EDITOR TODO.md"

# kubernetes helm
alias viva="$EDITOR values.yaml"

# =========================================================================
# Open a README file in the current directory; matches anything of the form
# README*, with any extension, case insenstive.
# =========================================================================
# alias vir="ls -1 | rgi readme --type file -i README | head | xargs nvim"
alias vir="ls -1 | rgi readme | head | xargs $EDITOR"
# function vir() {
#   fd --max-depth=1 -i 'README' --exec nvim
# }
