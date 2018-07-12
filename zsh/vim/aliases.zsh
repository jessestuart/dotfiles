#!/usr/bin/env bash
# ============
# Vim aliases.
# ============
# Sometimes I work on systems that don't have neovim. I know, right?
# Provide a fallback here so $EDITOR aliases still work.
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
alias vi.="$EDITOR ."
alias vi="$EDITOR"
alias vici="$EDITOR .circleci/config.yml"
alias vif="$EDITOR ~/.zsh/functions.zsh"
alias vik="$EDITOR ~/.zsh/kubernetes"
alias vikf="$EDITOR ~/.zsh/kubernetes/functions.zsh"
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
alias vihost="sudo $EDITOR /etc/hosts"
alias vidk="$EDITOR ~/dotfiles/zsh/docker"

# ======================
# **/aliases.zsh shortcuts
# ======================
alias via="$EDITOR ~/.zsh/aliases.zsh"
alias viagit="$EDITOR ~/.zsh/git/aliases.zsh"
alias vianti="vi ~/dotfiles/zsh/antibody"
alias viak="$EDITOR ~/.zsh/kubernetes/aliases.zsh"
alias viad="$EDITOR ~/.zsh/docker/aliases.zsh"
