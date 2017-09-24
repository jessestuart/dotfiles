# --------------------------------------
# History configuration
# --------------------------------------
export HISTFILE="$HOME/.zhistory"
export HISTSIZE=10000000
export SAVEHIST=10000000
# Treat the '!' character specially during expansion.
setopt BANG_HIST
# Write the history file in the ":start:elapsed;command" format.
setopt EXTENDED_HISTORY
# Write to the history file immediately, not when the shell exits.
setopt INC_APPEND_HISTORY
# Share history between all sessions.
setopt SHARE_HISTORY
# Expire duplicate entries first when trimming history.
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
# Do not record an entry that was just recorded again.
setopt HIST_IGNORE_SPACE
# Do not record an entry starting with a space.
setopt HIST_REDUCE_BLANKS
# Remove superfluous blanks before recording entry.
setopt HIST_VERIFY
# Do not execute immediately upon history expansion.
setopt HIST_BEEP
