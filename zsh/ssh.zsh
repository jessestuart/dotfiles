#!/usr/bin/env bash

# ==============================================================
# If no SSH agent is already running, start one now.
# Reuse sockets so we never have to start more than one session.
# ==============================================================
function start_ssh_agent() {
  ssh-add -l >/dev/null 2>&1
  if [ $? = 2 ]; then
     # No `ssh-agent` running.
     rm -rf "$SSH_AUTH_SOCK"
     # Ensure that future sessions will reuse the same `SSH_AUTH_SOCK`.
     export SSH_AUTH_SOCK=~/.ssh-socket

     local SSH_PID_FILE=~/.ssh-agent-pid
     eval "$(ssh-agent -a $SSH_AUTH_SOCK)"
     echo "$SSH_AGENT_PID" >| "$SSH_PID_FILE"
  fi
}
start_ssh_agent

ssh-add "$HOME/.ssh/*_rsa" &>/dev/null
