#!/usr/bin/env zsh

# Automatically installed by Serverless.
# @see http://serverless.com/
SLS_ROOT=/Users/jesse/.config/yarn/global/node_modules/serverless/node_modules/tabtab/.completions/
# 'tabtab' source for serverless package.
test -e "$SLS_ROOT/serverless.zsh" && . "$SLS_ROOT/serverless.zsh"
# 'tabtab' source for sls package
test -e "$SLS_ROOT/sls.zsh" && . "$SLS_ROOT/sls.zsh"
