# SDKMAN!
export SDKMAN_DIR="$HOME/.sdkman"
local SDKMAN_INIT="$SDKMAN_DIR/bin/sdkman-init.sh"
[[ "$SDKMAN_INIT" ]] && . "$SDKMAN_INIT" &> /dev/null

# Git Time Metrics.
source $HOME/bin/gtm-plugin.sh

# Autojump
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

test -e "${HOME}/.iterm2_shell_integration.zsh" && . "${HOME}/.iterm2_shell_integration.zsh"

# zsh: Place this in .zshrc after "source /Users/georgen/.iterm2_shell_integration.zsh".
function iterm2_print_user_vars() {
  iterm2_set_user_var gitBranch $((git branch 2> /dev/null) | grep \* | cut -c3-)
}

source "${HOME}/bin/google-cloud-sdk/path.zsh.inc"
source "${HOME}/bin/google-cloud-sdk/completion.zsh.inc"
