#!/usr/bin/env zsh

# ========================================================
# ZSH Options:
# @see http://zsh.sourceforge.net/Doc/Release/Options.html
# ========================================================

# Don't nice background tasks
setopt NO_BG_NICE
setopt NO_HUP
setopt NO_LIST_BEEP
setopt LOCAL_OPTIONS # allow functions to have local options
setopt LOCAL_TRAPS   # allow functions to have local traps
setopt PROMPT_SUBST
setopt COMPLETE_IN_WORD
# I'd like to use Ctrl+D to exit my shell, thank you.
unsetopt IGNORE_EOF

# ==============================
# 16.2.1 -- Changing directories
# ==============================
setopt AUTO_CD

# ====================
# 16.2.2 -- Completion
# ====================
setopt AUTO_LIST
setopt AUTO_PARAM_SLASH
setopt AUTO_REMOVE_SLASH
setopt LIST_TYPES

# ======================
# 16.2.6 -- Input/Output
# ======================
setopt ALIASES

##
# Completion
##
# hash everything before completion
setopt HASH_LIST_ALL
# when completing from the middle of a word, move the cursor to the end of the word
setopt ALWAYS_TO_END
# allow completion from within a word/phrase
setopt COMPLETE_IN_WORD
# spelling correction for commands
setopt CORRECT
# complete as much of a completion until it gets ambiguous.
setopt LIST_AMBIGUOUS

zmodload -i zsh/complist

WORDCHARS=''

# # do not autoselect the first completion entry
# unsetopt menu_complete
unsetopt flowcontrol
# show completion menu on successive tab press
setopt auto_menu
setopt complete_in_word
setopt always_to_end

# should this be in keybindings?
bindkey -M menuselect '^o' accept-and-infer-next-history
zstyle ':completion:*:*:*:*:*' menu select

# case insensitive (all), partial-word and substring completion
if [[ "$CASE_SENSITIVE" == true ]]; then
  zstyle ':completion:*' matcher-list 'r:|=*' 'l:|=* r:|=*'
else
  if [[ "$HYPHEN_INSENSITIVE" == true ]]; then
    zstyle ':completion:*' matcher-list 'm:{a-zA-Z-_}={A-Za-z_-}' 'r:|=*' 'l:|=* r:|=*'
  else
    zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
  fi
fi
unset CASE_SENSITIVE HYPHEN_INSENSITIVE

zstyle ':completion:*' list-colors ''
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'

# bindkey '^[^[[D' backward-word
# bindkey '^[^[[C' forward-word
# bindkey '^[[5D' beginning-of-line
# bindkey '^[[5C' end-of-line
# bindkey '^[[3~' delete-char
# bindkey '^?' backward-delete-char
