#!/bin/bash
# =================================================
# Convience aliases for systemd-based unix systems.
# =================================================

# Tail the journal log.
alias jxf="sudo journalctl -xef"
alias je="journalctl -er | nvim -R -c 'set ft=messages'"

# Tail the journal log for a specific "user".
# e.g., `jfu kubelet` will show all journal logs for the `kubelet` process(es).
alias jfu="sudo journalctl -ef -u"

function jf() {
  local lines=$(if [[ -z "$1" ]]; then echo 100; else echo $1; fi)
  if hash ccze &>/dev/null; then
    sudo journalctl -ef --lines $lines | ccze -A
  else
    sudo journalctl -ef --lines $lines
  fi
}

# Nifty aliases for interacting with `systemctl` -- these save me *SO* much time.
alias stl="sudo systemctl"
alias stls="sudo systemctl status"
alias stlr="sudo systemctl restart"
