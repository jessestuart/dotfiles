#!/bin/usr/env zsh

# =========================================================
# Just some convience commands for running the unbelievably
# useful `pssh`. It's no Ansible replacement by any means, but
# for issuing one-off commands across a cluster it hits the sweet
# spot in terms of simplicity and trasparency.

alias pshal="pssh -i -h ~/.pssh/all"
alias pscpal="pscp -h ~/.pssh/all"

alias pshpis="pssh -i -h ~/.pssh/rpis"
alias pscppis="pscp -h ~/.pssh/rpis"

alias pshwrk="pssh -i -h ~/.pssh/wrk"
alias pscpwrk="pscp -h ~/.pssh/wrk"

alias pshgluster="pssh -i -h ~/.pssh/gluster"
alias pscpgluster="pscp -h ~/.pssh/gluster"

alias pshrock="pssh -i -h ~/.pssh/rock"
alias pscprock="pscp -h ~/.pssh/rock"

alias pshff="pssh -i -h ~/.pssh/ff"
alias pscpff="pscp -h ~/.pssh/ff"
