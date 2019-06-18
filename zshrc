#!/usr/bin/env zsh

# Reload the login shell with ZPROFILE flag set (i.e., `ZPROFILE=1 exec
# /usr/local/bin/zsh -l`) to profile ZSH startup time.
if ! test -z $ZPROFILE; then zmodload zsh/zprof; fi

source "$HOME/.zsh/init" &>/dev/null

test -e "$HOME/.iterm2_shell_integration.zsh" &&
  source "$HOME/.iterm2_shell_integration.zsh"

if ! test -z $ZPROFILE; then
  zprof | head -n20 | tail -n+3 | sort -k5nr
  unset ZPROFILE
fi
