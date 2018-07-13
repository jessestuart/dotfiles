#!/usr/bin/env zsh

# Sometimes I work on systems that don't have neovim. I know, right?
# Provide a fallback here so $EDITOR aliases still work.
if (hash nvim &>/dev/null); then
  export EDITOR='nvim'
elif (hash vim &>/dev/null); then
  export EDITOR='vim'
else
  export EDITOR='vi'
fi

