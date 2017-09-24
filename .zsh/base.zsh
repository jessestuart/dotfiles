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

# plugins=(
#   git
#   utility
#   homebrew
#   tmux
#   osx
#   prompt
#   command-not-found
#   zsh-users/zsh-autosuggestions
#   zsh-users/zsh-completions
#   zsh-users/zsh-syntax-highlighting
#   zsh-users/zsh-history-substring-search
#   rupa/z
# )

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

# Allow completing of the remainder of a command
bindkey "^N" insert-last-word

[ -f "${HOME}/.asdf/asdf.sh" ] && . "$HOME/.asdf/asdf.sh"

fpath=(/usr/local/share/zsh-completions $fpath)
