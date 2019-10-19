#!/bin/bash

[ -f ~/.gnupg/gpg-agent.env ] && source ~/.gnupg/gpg-agent.env &>/dev/null
if [ -S "${GPG_AGENT_INFO%%:*}" ]; then
  echo one
  export GPG_AGENT_INFO
else
  eval $(gpg-agent --daemon --log-file /tmp/gpg.log --pinentry-program /usr/local/bin/pinentry-mac &>/dev/null)
fi
