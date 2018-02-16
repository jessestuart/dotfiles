#!/usr/bin/env zsh

# Uncomment the below lines to profile ZSH startup time.
# zmodload zsh/zprof
source "$HOME/.zsh/init"
# zprof
#
export GOPATH=$HOME/go
export GOROOT=/usr/local/go
export PATH=$PATH:/usr/local/go/bin:~/go/bin
export PATH=$PATH:/home/linuxbrew/.linuxbrew/bin
export PATH=$PATH/var/home/linuxbrew/.linuxbrew/bin

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
