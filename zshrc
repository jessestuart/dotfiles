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

# For Timing.app
if [ $ITERM_SESSION_ID ]; then
  DISABLE_AUTO_TITLE="true"
  echo -ne "\033]0; ${USER} @ ${HOSTNAME%% .* } : ${PWD/# $HOME/ ~} \007"
fi
precmd() {
  echo -ne "\033]0; ${USER} @ ${HOSTNAME%% .* } : ${PWD/# $HOME/ ~} \007"
}

export GO111MODULE=on

export LESSOPEN="|/usr/local/bin/lesspipe.sh %s" LESS_ADVANCED_PREPROCESSOR=1

export HISTORIAN_SRC="${HOME}/.zhistory"

source ${HOME}/Library/Caches/antibody/https-COLON--SLASH--SLASH-github.com-SLASH-larkery-SLASH-zsh-histdb/sqlite-history.zsh
autoload -Uz add-zsh-hook
add-zsh-hook precmd histdb-update-outcome
