# SDKMAN!
export SDKMAN_DIR="$HOME/.sdkman"
local SDKMAN_INIT="$SDKMAN_DIR/bin/sdkman-init.sh"
[[ "$SDKMAN_INIT" ]] && . "$SDKMAN_INIT" &> /dev/null

# Git Time Metrics.
source $HOME/bin/gtm-plugin.sh

# Autojump
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

test -e "${HOME}/.iterm2_shell_integration.zsh" && . "${HOME}/.iterm2_shell_integration.zsh"


