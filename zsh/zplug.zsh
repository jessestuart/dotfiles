#!/bin/zsh

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
# zplug load &>/dev/null
