#!/usr/bin/env zsh

if hash gtm &>/dev/null; then
  antibody bundle git-time-metric/gtm-terminal-plugin
fi

# if hash wakatime &>/dev/null; then
#   antibody bundle sobolevn/wakatime-zsh-plugin
# fi
