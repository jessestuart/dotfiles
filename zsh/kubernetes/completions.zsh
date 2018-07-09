#!/usr/bin/env zsh
# if (hash helm &>/dev/null); then source <(helm completion zsh); fi

if (hash kubectl &>/dev/null); then
  source <(kubectl completion zsh)
fi
