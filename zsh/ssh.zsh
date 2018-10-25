#!/usr/bin/env bash

# ==============================================================
# If no SSH agent is already running, start one now.
# Reuse sockets so we never have to start more than one session.
# ==============================================================
function start_ssh_agent() {
  ssh-add -l >/dev/null 2>&1
  if [ $? = 2 ]; then
     # No `ssh-agent` running.
     export SSH_AUTH_SOCK=~/.ssh-socket
     rm -rf "$SSH_AUTH_SOCK"
     # ^ Ensure that future sessions will reuse the same `SSH_AUTH_SOCK`.

     local SSH_PID_FILE=~/.ssh-agent-pid
     # Don't print the "Agent pid [...]" message.
     eval "$(ssh-agent -a $SSH_AUTH_SOCK)" &>/dev/null
     echo "$SSH_AGENT_PID" >| "$SSH_PID_FILE"
  fi
}

# start_ssh_agent

# ssh-add "$HOME/.ssh/github_rsa" &>/dev/null
