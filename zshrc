#!/usr/bin/env zsh

# Uncomment the below lines to profile ZSH startup time.
if [ "$ZPROFILE" -eq 1 ]; then zmodload zsh/zprof; fi

source "$HOME/.zsh/init"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

if [ "$ZPROFILE" -eq 1 ]; then
  zprof | head -n20 | tail -n+3 | sort -k5nr
  unset ZPROFILE
fi
