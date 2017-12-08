# Git Time Metrics.
source $HOME/bin/gtm-plugin.sh

# Autojump
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

# FZF!
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# iTerm2 Shell Integration:
test -e "${HOME}/.iterm2_shell_integration.zsh" && . "${HOME}/.iterm2_shell_integration.zsh"
# zsh: Place this in .zshrc after "source /Users/georgen/.iterm2_shell_integration.zsh".
function iterm2_print_user_vars() {
  iterm2_set_user_var gitBranch $((git branch 2> /dev/null) | grep \* | cut -c3-)
}

# SDKMAN!
export SDKMAN_DIR="$HOME/.sdkman"
local SDKMAN_INIT="$SDKMAN_DIR/bin/sdkman-init.sh"
[[ "$SDKMAN_INIT" ]] && . "$SDKMAN_INIT" &> /dev/null

local GCP_ROOT="${HOME}/bin/google-cloud-sdk"
[[ "$GCP_ROOT" ]] && . "$GCP_ROOT/path.zsh.inc" &>/dev/null
[[ "$GCP_ROOT" ]] && . "$GCP_ROOT/completion.zsh.inc" &>/dev/null

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh

# tabtab source for yarn package
# uninstall by removing these lines or running `tabtab uninstall yarn`
[[ -f /usr/local/lib/node_modules/yarn-completions/node_modules/tabtab/.completions/yarn.zsh ]] && . /usr/local/lib/node_modules/yarn-completions/node_modules/tabtab/.completions/yarn.zsh
