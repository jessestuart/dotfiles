#!/usr/bin/env zsh

# Uncomment the below lines to profile ZSH startup time.
if [ "$ZPROFILE" -eq 1 ]; then zmodload zsh/zprof; fi

source "$HOME/.zsh/init"

# eval "$(direnv hook zsh)"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# export PATH="/usr/local/opt/ruby@2.4/bin:$PATH"
# export PATH="/usr/local/opt/ruby/bin:$PATH"
test -e "$HOME/github/rupa/z/z.sh" && . "$HOME/github/rupa/z/z.sh"

if [ "$ZPROFILE" -eq 1 ]; then
  zprof | head -n20 | tail -n+3 | sort -k5nr
  unset ZPROFILE
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
