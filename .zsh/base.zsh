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

# Break out additional configuration into separate files to
# keep things neat and tidy.
# for file in ~/.{path,exports,aliases,docker-utils,functions,secrets}; do
# 	[ -r "$file" ] && [ -f "$file" ] && source "$file";
# done;
# unset file;

# --------------------------------------
# History configuration
# --------------------------------------
# export HISTFILE="$HOME/.zhistory"
# export HISTSIZE=10000000
# export SAVEHIST=10000000
# # Treat the '!' character specially during expansion.
# setopt BANG_HIST
# # Write the history file in the ":start:elapsed;command" format.
# setopt EXTENDED_HISTORY
# # Write to the history file immediately, not when the shell exits.
# setopt INC_APPEND_HISTORY
# # Share history between all sessions.
# setopt SHARE_HISTORY
# # Expire duplicate entries first when trimming history.
# setopt HIST_EXPIRE_DUPS_FIRST
# setopt HIST_IGNORE_DUPS
# # Do not record an entry that was just recorded again.
# setopt HIST_IGNORE_SPACE
# # Do not record an entry starting with a space.
# setopt HIST_REDUCE_BLANKS
# # Remove superfluous blanks before recording entry.
# setopt HIST_VERIFY
# # Do not execute immediately upon history expansion.
# setopt HIST_BEEP
# # Beep when accessing nonexistent history.

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

[ -f "${HOME}/.asdf/asdf.sh" ] && . "$HOME/.asdf/asdf.sh"

fpath=(/usr/local/share/zsh-completions $fpath)
