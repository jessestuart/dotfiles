#!/usr/bin/env zsh
[ -f ~/.fzf.zsh ] && . ~/.fzf.zsh

# --files: List files that would be searched but do not search
# --no-ignore: Do not respect .gitignore, etc...
# --hidden: Search hidden files and folders
# --follow: Follow symlinks
# --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
# export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'

# Adapted from:
# http://owen.cymru/fzf-ripgrep-navigate-with-bash-faster-than-ever-before/
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g "!{.git,node_modules}/*" 2> /dev/null'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
# bindkey "^P" "vim $(fzf)"
# bind -x '"\C-p": vim $(fzf);'
function _fzf_to_editor() {
  zle kill-whole-line
  zle -U "nvim $(fzf)"
  zle accept-line
}
zle -N _fzf_to_editor
bindkey '^y' _fzf_to_editor
