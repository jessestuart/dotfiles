#!/usr/bin/env zsh

# Uncomment the below lines to profile ZSH startup time.
if ! test -z $ZPROFILE; then zmodload zsh/zprof; fi

source "$HOME/.zsh/init"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

if ! test -z $ZPROFILE; then
  zprof | head -n20 | tail -n+3 | sort -k5nr
  unset ZPROFILE
fi

export GO111MODULE=auto

# autoload -U +X bashcompinit && bashcompinit
# complete -o nospace -C /Users/jesse/go/src/github.com/minio/mc/mc mc

# complete -o nospace -C /Users/jesse/go/bin/mc mc
