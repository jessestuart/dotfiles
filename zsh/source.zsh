#!/usr/bin/env zsh
# Git Time Metrics ⏱
test -e "$HOME/bin/gtm-plugin.sh" && . "$HOME/bin/gtm-plugin.sh"
test -e "$HOME/dotfiles/bin/gtm-plugin.sh" && . "$HOME/dotfiles/bin/gtm-plugin.sh"

# FZF 🔎
test -e "$HOME/.fzf.zsh" && . "$HOME/.fzf.zsh"

# Autojump 🚀
function j() {
  (( $+commands[brew] )) && {
      local pfx=$(brew --prefix)
      [[ -f "$pfx/etc/autojump.sh" ]] && . "$pfx/etc/autojump.sh"
      j "$@"
  }
}
# function load_autojump() {
#   local MAC_ROOT="/usr/local/etc/profile.d/autojump.sh"
#   local LINUX_ROOT="/home/linuxbrew/.linuxbrew/etc/profile.d/autojump.sh"
#   test -e "$MAC_ROOT" && . "$MAC_ROOT"
#   test -e "$LINUX_ROOT" && . "$LINUX_ROOT"
# }
# load_autojump

# SDKMAN!
function load_sdkman() {
  export SDKMAN_DIR="$HOME/.sdkman"
  local SDKMAN_INIT="$SDKMAN_DIR/bin/sdkman-init.sh"
  test -e "$SDKMAN_INIT" && . "$SDKMAN_INIT" &> /dev/null
}
# load_sdkman

# function load_tabtab() {
#   local TABTAB_ROOT=/usr/local/lib/node_modules/tabtab/.completions
#   test -e "$TABTAB_ROOT/serverless.zsh" && . "$TABTAB_ROOT/servless.zsh"
#   test -e "$TABTAB_ROOT/sls.zsh" && . "$TABTAB_ROOT/sls.zsh"
#   test -e "$TABTAB_ROOT/yarn.zsh" && . "$TABTAB_ROOT/yarn.zsh"
# }
# load_tabtab

# Load `awless` completions.
function load_awless() {
  source /usr/local/share/zsh/site-functions/_awless
}

# ===================
# OS-specific sources
# ===================
PLATFORM=`uname`

function load_linuxbrew() {
  local LINUXBREW_HOME=$(readlink -f /home/linuxbrew)
  if [ -e "$LINUXBREW_HOME" ]; then
    export PATH="$LINUXBREW_HOME/.linuxbrew/bin:$LINUXBREW_HOME/.linuxbrew/sbin:$PATH"
  fi
}
if [ "$PLATFORM" = 'Linux' ]; then load_linuxbrew; fi

function load_virtualenv() {
  export WORKON_HOME=~/.virtualenvs
  mkdir -p $WORKON_HOME
  source ~/.local/bin/virtualenvwrapper.sh
}

function load_conda() {
  test -e "$HOME/bin/miniconda3" && . "$HOME/bin/miniconda3/bin/activate"
}

function load_doctl() {
  eval "$(doctl completion zsh)"
}
# load_doctl

function load_bashmarks() {
  local bashmarks="$HOME/.local/bin/bashmarks.sh"
  test -e $bashmarks && . $bashmarks
}
load_bashmarks

# iTerm2 Shell Integration:
test -e "${HOME}/.iterm2_shell_integration.zsh" && . "${HOME}/.iterm2_shell_integration.zsh"
# zsh: Place this in .zshrc after `source ~/.iterm2_shell_integration.zsh`.
function iterm2_print_user_vars() {
  iterm2_set_user_var gitBranch $((git branch 2> /dev/null) | grep \* | cut -c3-)
}

