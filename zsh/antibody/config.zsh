#!/usr/bin/env zsh

if hash gtm &>/dev/null; then
  antibody bundle jessestuart/gtm-terminal-plugin &>/dev/null
fi

if hash wakatime &>/dev/null; then
  antibody bundle sobolevn/wakatime-zsh-plugin &>/dev/null
fi
