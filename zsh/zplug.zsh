#!/usr/bin/env zsh

async_init
async_start_worker my_worker -n
function load_zplug() {
  source "$HOME/.zplug/init.zsh"
  zplug "zplug/zplug", hook-build:'zplug --self-manage', defer:2
  zplug "wbinglee/zsh-wakatime", from:github, defer:2

  zplug "module/editor", from:prezto
  zplug "module/history", from:prezto
  zplug "module/directory", from:prezto
  zplug "module/spectrum", from:prezto
  zplug "module/utility", from:prezto
  zplug "module/homebrew", from:prezto
  zplug "module/tmux", from:prezto
  zplug "module/ssh", from:prezto
  zplug "module/history-substring-search", from:prezto
  zplug "module/autosuggestions", from:prezto
  zplug "module/completion", from:prezto
  zplug "module/completions", from:prezto

  # # Grab binaries from GitHub Releases
  # # and rename with the "rename-to:" tag
  # zplug "junegunn/fzf-bin", \
    #     from:gh-r, \
    #     as:command, \
    #     rename-to:fzf, \
    #     use:"*darwin*amd64*"

  zplug "zsh-users/zsh-syntax-highlighting"
  zplug "zsh-users/zsh-history-substring-search"

  zplug "mafredri/zsh-async", from:github, use:async.zsh

  zplug "module/syntax-highlighting", from:prezto
  zplug "modules/prompt", from:prezto
  zplug "modules/attr", from:prezto
  zplug "modules/stat", from:prezto
  zplug "modules/complete", from:prezto
  zplug "modules/complist", from:prezto
  zplug "zsh-users/computil", from:prezto

  # zplug "DFurnes/purer", use:purer.zsh, from:github, as:theme
  zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme

  # Supports oh-my-zsh plugins and the like
  zplug "plugins/git",   from:oh-my-zsh, defer:2

  zplug "zsh-users/autosuggestions", from:prezto, defer:2

  # Install plugins if there are plugins that have not been installed
  if ! zplug check; then
    printf "Install? [y/N]: "
    if read -q; then
      echo; zplug install
    fi
  fi

  # Then, source plugins and add commands to $PATH
  "$(zplug load)"
}
async_job my_worker load_zplug

# TODO: Uncomment when I figure out why this is slowing down my shell
#       startup time so much.
# load_zplug
compinit
