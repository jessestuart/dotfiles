#!/usr/bin/env zsh
# --------------------------------------
# Sets Prezto options.
# --------------------------------------

#
# General
#

# Set case-sensitivity for completion, history lookup, etc.
zstyle ':prezto:*:*' case-sensitive 'no'

# Color output (auto set to 'no' on dumb terminals).
zstyle ':prezto:*:*' color 'yes'

# Set the Zsh modules to load (man zshmodules).
zstyle ':prezto:load' zmodule 'attr' 'stat' 'complete' 'complist' 'computil'

# Set the Zsh functions to load (man zshcontrib).
zstyle ':prezto:load' zfunction 'zargs' 'zmv'

# Set the Prezto modules to load (browse modules).
# The order matters.
zstyle ':prezto:load' pmodule \
  'environment' \
  'terminal' \
  'editor' \
  'history' \
  'directory' \
  'spectrum' \
  'utility' \
  'homebrew' \
  'docker' \
  'tmux' \
  'ssh' \
  'history-substring-search' \
  'autosuggestions' \
  'completion' \
  'syntax-highlighting' \
  'prompt'

#
# Autosuggestions
#

# Set the query found color.
zstyle ':prezto:module:autosuggestions:color' found 'fg=242'

#
# Editor
#

# Set the key mapping style to 'emacs' or 'vi'.
zstyle ':prezto:module:editor' key-bindings 'vi'

# Auto convert .... to ../..
zstyle ':prezto:module:editor' dot-expansion 'yes'

# Allow the zsh prompt context to be shown.
zstyle ':prezto:module:editor' ps-context 'yes'

#
# Git
#

# Ignore submodules when they are 'dirty', 'untracked', 'all', or 'none'.
zstyle ':prezto:module:git:status:ignore' submodules 'untracked'

#
# GNU Utility
#

# Set the command prefix on non-GNU systems.
zstyle ':prezto:module:gnu-utility' prefix 'g'

#
# Utility Module
#
zstyle ':prezto:module:utility' safe-ops 'no'

#
# History Substring Search
#

# Set the query found color.
zstyle ':prezto:module:history-substring-search:color' found ''

# Set the query not found color.
zstyle ':prezto:module:history-substring-search:color' not-found ''

# Set the search globbing flags.
zstyle ':prezto:module:history-substring-search' globbing-flags ''

#
# Pacman
#

# Set the Pacman frontend.
zstyle ':prezto:module:pacman' frontend 'yaourt'

#
# Prompt
#

# Set the prompt theme to load.
# Setting it to 'random' loads a random theme.
# Auto set to 'off' on dumb terminals.
zstyle ':prezto:module:prompt' theme 'pure'

# Set how themes that use promptpwd function display the pwd, can be 'short', 'long', or 'full'
zstyle ':prezto:module:prompt' pwd-length 'long'

#
# SSH
#

# Set the SSH identities to load into the agent.
zstyle ':prezto:module:ssh:load' identities \
  'aws_rsa' \
  'do_rsa' \
  'gcp_rsa' \
  'github_rsa' \
  'gitlab_rsa' \
  'id_rsa'

#
# Syntax Highlighting
#

# Set syntax highlighters.
# By default, only the main highlighter is enabled.
zstyle ':prezto:module:syntax-highlighting' highlighters \
  'main' \
  'brackets' \
  'pattern' \
  'line' \
  'cursor' \
  'root'

# Set syntax pattern styles.
zstyle ':prezto:module:syntax-highlighting' pattern \
  'rm*-rf*' 'fg=white,bold,bg=red'

#
# Terminal
#

# Auto set the tab and window titles.
zstyle ':prezto:module:terminal' auto-title 'yes'

# Set the window title format.
zstyle ':prezto:module:terminal:window-title' format '%n@%m: %s'

# Set the tab title format.
zstyle ':prezto:module:terminal:tab-title' format '%m: %s'

#
# Tmux
#

# Auto start a session when Zsh is launched in a local terminal.
# zstyle ':prezto:module:tmux:auto-start' local 'yes'

# Auto start a session when Zsh is launched in a SSH connection.
zstyle ':prezto:module:tmux:auto-start' remote 'yes'

# Integrate with iTerm2.
zstyle ':prezto:module:tmux:iterm' integrate 'yes'

setopt clobber
