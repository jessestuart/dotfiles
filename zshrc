#!/usr/bin/env zsh

# Reload the login shell with ZPROFILE flag set:
# (e.g., `ZPROFILE=1 exec /usr/local/bin/zsh -l`) to profile ZSH startup time.
if ! test -z $ZPROFILE; then zmodload zsh/zprof; fi
source "$HOME/.zsh/init"

# For Timing.app:
if [ $ITERM_SESSION_ID ]; then
  DISABLE_AUTO_TITLE="true"
  echo -ne "\033]0; ${USER} @ ${HOSTNAME%% .* } : ${PWD/# $HOME/ ~} \007"
fi
export PROMPT_TITLE='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/~}\007"'
export PROMPT_COMMAND="${PROMPT_TITLE}; ${PROMPT_COMMAND}"
precmd() {
  echo -ne "\033]0; ${USER}@${HOSTNAME%% .* }:${PWD/# $HOME/ ~} \007"
}

export LESSOPEN="|/usr/local/bin/lesspipe.sh %s" LESS_ADVANCED_PREPROCESSOR=1

if hash sqlite3 &>/dev/null; then
  source "$(antibody home)/https-COLON--SLASH--SLASH-github.com-SLASH-larkery-SLASH-zsh-histdb/sqlite-history.zsh"
  autoload -Uz add-zsh-hook
  add-zsh-hook precmd histdb-update-outcome
fi

# autoload -U +X bashcompinit && bashcompinit
# complete -o nospace -C /Users/jesse/go/bin/mc mc

# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

if ! test -z $ZPROFILE; then
  # zprof
  zprof | head -n20 | tail -n+3 | sort -k5nr
  unset ZPROFILE
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
