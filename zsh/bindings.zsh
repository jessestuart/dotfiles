#!/usr/bin/env zsh

# Change inner text object (e.g., ci")
autoload -U select-quoted
zle -N select-quoted
for m in visual viopp; do
  for c in {a,i}{\',\",\`}; do
    bindkey -M $m $c select-quoted
  done
done

# ci{, ci(
autoload -U select-bracketed
zle -N select-bracketed
for m in visual viopp; do
  for c in {a,i}${(s..)^:-'()[]{}<>bB'}; do
    bindkey -M $m $c select-bracketed
  done
done

# surround
autoload -Uz surround
zle -N delete-surround surround
zle -N add-surround surround
zle -N change-surround surround
bindkey -a cs change-surround
bindkey -a ds delete-surround
bindkey -a ys add-surround
bindkey -M visual S add-surround

# Use 'v' at readline (in normal mode) to edit the current command in a
# (neo)vim buffer. Nifty.
autoload -U edit-command-line
zle -N edit-command-line
bindkey -M vicmd "^V" edit-command-line

## http://www.zsh.org/mla/users/2010/msg00769.html
function rationalise-dot() {
  local MATCH # keep the regex match from leaking to the environment
  if [[ $LBUFFER =~ '(^|/| |      |'$'\n''|\||;|&)\.\.$' && ! $LBUFFER = p4* ]]; then
    #if [[ ! $LBUFFER = p4* && $LBUFFER = *.. ]]; then
    LBUFFER+=/..
  else
    zle self-insert
  fi
}
zle -N rationalise-dot
bindkey . rationalise-dot
bindkey -M isearch . self-insert
# h/t http://stratus3d.com/blog/2017/10/26/better-vi-mode-in-zshell/
# Better searching in command mode
bindkey -M vicmd '?' history-incremental-search-backward
bindkey -M vicmd '/' history-incremental-search-forward

# Beginning search with arrow keys
bindkey "^[OA" up-line-or-beginning-search
bindkey "^[OB" down-line-or-beginning-search
# bindkey -M vicmd "k" up-line-or-beginning-search
# bindkey -M vicmd "j" down-line-or-beginning-search

bindkey '^L' autosuggest-accept
bindkey '^K' autosuggest-accept
bindkey -M vicmd '<C-p>' autosuggest-accept
# Map ⌘  + h (implemented in iTerm) to autosuggest-accept
bindkey '^[end' autosuggest-accept

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
