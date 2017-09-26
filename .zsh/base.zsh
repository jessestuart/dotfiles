# =============================================================================
# Jesse does dotfiles: The ZSH edition.
# =============================================================================

# --------------------------------------
# Base ZSH configuration.
# --------------------------------------
# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# @see https://unix.stackexchange.com/questions/277203/whats-the-fastest-way-to-remove-all-files-subfolders-in-a-directory
autoload zsh/files
autoload -U promptinit; promptinit
prompt pure

# --------------------------------------
# Miscellany.
# --------------------------------------

# Autojump
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

# Hook for desk activation
[ -n "$DESK_ENV" ] && source "$DESK_ENV" || true

eval "$(fasd --init auto)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(ssh-agent)" &> /dev/null
ssh-add -K -A ~/.ssh/*_rsa &> /dev/null

test -e "${HOME}/.iterm2_shell_integration.zsh" && . "${HOME}/.iterm2_shell_integration.zsh"

export GPG_TTY=$(tty)

# Allow completing of the remainder of a command -- super useful!
bindkey "^N" insert-last-word

[ -f "${HOME}/.asdf/asdf.sh" ] && . "$HOME/.asdf/asdf.sh"

[ -f "${HOME}/.zsh/tmux/completions.zsh" ] && . "${HOME}/.zsh/tmux/completions.zsh"

# bindkey -v

# bindkey '^A'
# bindkey '^P' up-history
# bindkey '^N' down-history
# bindkey '^?' backward-delete-char
# bindkey '^h' backward-delete-char
# bindkey '^w' backward-kill-word
# bindkey '^r' history-incremental-search-backward

# function zle-line-init zle-keymap-select {
#     VIM_PROMPT="%{$fg_bold[yellow]%} [% NORMAL]%  %{$reset_color%}"
#     RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/}$(git_custom_status) $EPS1"
#     zle reset-prompt
# }

zle -N zle-line-init
zle -N zle-keymap-select
export KEYTIMEOUT=1

fpath=(/usr/local/share/zsh-completions $fpath)
