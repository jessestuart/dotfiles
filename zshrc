#!/usr/bin/env zsh
# Uncomment the below lines to profile ZSH startup time.
# zmodload zsh/zprof
source "$HOME/.zsh/zshrc"
# zprof


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /Users/jestuart/.npm-global/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /Users/jestuart/.npm-global/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /Users/jestuart/.npm-global/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /Users/jestuart/.npm-global/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh