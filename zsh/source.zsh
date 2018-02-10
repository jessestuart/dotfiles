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

# SDKMAN!
function load_sdkman() {
  export SDKMAN_DIR="$HOME/.sdkman"
  local SDKMAN_INIT="$SDKMAN_DIR/bin/sdkman-init.sh"
  test -e "$SDKMAN_INIT" && . "$SDKMAN_INIT" &> /dev/null
}
# Slows down ZSH startup time by ~250ms. Ugh.
# load_sdkman

# Load `awless` completions.
function load_awless() {
  local awless_completions=/usr/local/share/zsh/site-functions/_awless
  test -e "$awless_completions" && . "$awless_completions"
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

function load_bashmarks() {
  local bashmarks="$HOME/.local/bin/bashmarks.sh"
  test -e $bashmarks && . $bashmarks
}
load_bashmarks

# function load_asdf() {
#   local asdf_init=/usr/local/opt/asdf/asdf.sh
#   test -e $asdf_init && . $asdf_init
# }
# load_asdf

if (hash zaw&>/dev/null); then . $(which zaw); fi
test -e ~/github/z/z.sh && . ~/github/z/z.sh

if [ "$PLATFORM" = 'Darwin' ]; then
  # iTerm2 Shell Integration:
  test -e "${HOME}/.iterm2_shell_integration.zsh" && \
    . "${HOME}/.iterm2_shell_integration.zsh"
  # zsh: Place this in .zshrc after `source ~/.iterm2_shell_integration.zsh`.
  function iterm2_print_user_vars() {
    iterm2_set_user_var gitBranch $((git branch 2> /dev/null) | grep \* | cut -c3-)
  }
fi
