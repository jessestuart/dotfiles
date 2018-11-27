#!/usr/bin/env zsh

# Profile zsh startup time by running e.g., `ZPROFILE=1 source ~/.zshrc`
if [ "$ZPROFILE" -eq 1 ]; then zmodload zsh/zprof; fi

source "$HOME/.zsh/init"

# eval "$(direnv hook zsh)"

if [ "$ZPROFILE" -eq 1 ]; then
  zprof | head -n20 | tail -n+3 | sort -k5nr
  unset ZPROFILE
fi
