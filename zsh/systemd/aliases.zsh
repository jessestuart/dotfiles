#!/bin/bash
# =============================================
# Convience aliases systemd-based unix systems.
# =============================================

# Tail the journal log.
alias jf="sudo journalctl -xef"
# Tail the journal log for a specific "user".
# e.g., `jxfu kubelet` will show all journal logs for the `kubelet` process(es).
alias jfu="sudo journalctl -xef -u"

alias stl="sudo systemctl"
alias stls="sudo systemctl status"
alias stlr="sudo systemctl restart"
