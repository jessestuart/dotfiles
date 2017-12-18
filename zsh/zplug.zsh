#!/bin/zsh

function load_zplug() {
  if ! (type zplug &>/dev/null); then
    return 0
  fi
  zplug 'zplug/zplug', hook-build:'zplug --self-manage'
  zplug 'wbinglee/zsh-wakatime'

  # Install plugins if there are plugins that have not been installed
  if ! zplug check; then
      printf "Install? [y/N]: "
      if read -q; then
          echo; zplug install
      fi
  fi

  # Then, source plugins and add commands to $PATH
  $(zplug load)
}
load_zplug
