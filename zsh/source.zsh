# Git Time Metrics ⏱
test -e "$HOME/bin/gtm-plugin.sh" && . "$HOME/bin/gtm-plugin.sh"

# FZF 🔎
test -e "$HOME/.fzf.zsh" && . "$HOME/.fzf.zsh"

# Autojump 🚀
function load_autojump() {
  local MAC_ROOT="/usr/local/etc/profile.d/autojump.sh"
  local LINUX_ROOT="/home/linuxbrew/.linuxbrew/etc/profile.d/autojump.sh"
  test -e "$MAC_ROOT" && . "$MAC_ROOT"
  test -e "$LINUX_ROOT" && . "$LINUX_ROOT"
}
load_autojump

# SDKMAN!
function load_sdkman() {
  export SDKMAN_DIR="$HOME/.sdkman"
  local SDKMAN_INIT="$SDKMAN_DIR/bin/sdkman-init.sh"
  test -e "$SDKMAN_INIT" && . "$SDKMAN_INIT" &> /dev/null
}
load_sdkman

function load_google_cloud_platform_libs() {
  # The next line updates PATH for the Google Cloud SDK.
  local ROOT="$HOME/bin/google-cloud-sdk"
  test -e "$ROOT/path.zsh.inc" && . "$ROOT/path.zsh.inc"
  test -e "$ROOT/completion.zsh.inc" && . "$ROOT/completion.zsh.inc"
}
load_google_cloud_platform_libs

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh

# tabtab source for yarn package
# uninstall by removing these lines or running `tabtab uninstall yarn`
[[ -f /usr/local/lib/node_modules/yarn-completions/node_modules/tabtab/.completions/yarn.zsh ]] && . /usr/local/lib/node_modules/yarn-completions/node_modules/tabtab/.completions/yarn.zsh

# iTerm2 Shell Integration:
test -e "${HOME}/.iterm2_shell_integration.zsh" && . "${HOME}/.iterm2_shell_integration.zsh"
# zsh: Place this in .zshrc after `source ~/.iterm2_shell_integration.zsh`.
function iterm2_print_user_vars() {
  iterm2_set_user_var gitBranch $((git branch 2> /dev/null) | grep \* | cut -c3-)
}
