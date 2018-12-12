#!/usr/bin/env zsh

# Uncomment the below lines to profile ZSH startup time.
if [ "$ZPROFILE" -eq 1 ]; then zmodload zsh/zprof; fi

source "$HOME/.zsh/init"

# # Init prompt.
# autoload -U promptinit
# promptinit

# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export PATH="$HOME/.bin/:$PATH"

# eval "$(direnv hook zsh)"

zle-keymap-select() {
  if [ "$TERM" = "xterm-256color" ]; then
    if [ $KEYMAP = vicmd ]; then
      # the command mode for vi
      echo -ne "\e[2 q"
    else
      # the insert mode for vi
      echo -ne "\e[4 q"
    fi
  fi
}

# begin appcenter completion
# . <(appcenter --completion)
# end appcenter completion

# load_sdkman

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

if [ "$ZPROFILE" -eq 1 ]; then
  zprof | head -n20 | tail -n+3 | sort -k5nr
  unset ZPROFILE
fi

export PATH="/usr/local/opt/node@10/bin:$PATH"
export PATH="/usr/local/opt/ruby/bin:$PATH"
