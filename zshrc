#!/usr/bin/env zsh

# Uncomment the below lines to profile ZSH startup time.
if ! test -z $ZPROFILE; then zmodload zsh/zprof; fi

source "$HOME/.zsh/init" &>/dev/null

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

if ! test -z $ZPROFILE; then
  zprof | head -n20 | tail -n+3 | sort -k5nr
  unset ZPROFILE
fi

eval "$(jump shell zsh)"

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/mc mc

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
