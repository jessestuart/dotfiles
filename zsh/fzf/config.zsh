#!/usr/bin/env zsh
[ -f ~/.fzf.zsh ] && . ~/.fzf.zsh

# Adapted from:
# http://owen.cymru/fzf-ripgrep-navigate-with-bash-faster-than-ever-before/
# --files: List files that would be searched but do not search
# --no-ignore: Do not respect .gitignore, etc...
# --hidden: Search hidden files and folders
# --follow: Follow symlinks
# --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow -g "!{.git,node_modules}/*" 2> /dev/null'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Adapted from:
# https://remysharp.com/2018/08/23/cli-improved
alias preview="fzf --preview 'bat --color \"always\" {}'"
# add support for ctrl+o to open selected file in VS Code
export FZF_DEFAULT_OPTS="--bind='ctrl-o:execute(nvim {})+abort'"
