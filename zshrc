#!/usr/bin/env zsh

# Uncomment the below lines to profile ZSH startup time.
if [ "$ZPROFILE" -eq 1 ]; then zmodload zsh/zprof; fi
source "$HOME/.zsh/init"
if [ "$ZPROFILE" -eq 1 ]; then
  zprof | head -n20 | tail -n+3 | sort -k5nr
  unset ZPROFILE
fi

  # Set Spaceship ZSH as a prompt
  autoload -U promptinit; promptinit
  prompt spaceship

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
