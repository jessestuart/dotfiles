#!/bin/usr/env zsh

# =========================================================
# Just some convience commands for running the unbelievably
# useful `pssh`. It's no Ansible replacement by any means, but
# for issuing one-off commands across a cluster it hits the sweet
# spot in terms of simplicity and trasparency.

alias pshal="DEBIAN_FRONTEND=noninteractive pssh -i -h ~/.pssh/all"
alias pscpal="DEBIAN_FRONTEND=noninteractive pscp -h ~/.pssh/all"

alias pshpis="DEBIAN_FRONTEND=noninteractive pssh -i -h ~/.pssh/rpis"
alias pscppis="DEBIAN_FRONTEND=noninteractive pscp -h ~/.pssh/rpis"

alias pshwrk="DEBIAN_FRONTEND=noninteractive pssh -i -h ~/.pssh/wrk"
alias pscpwrk="DEBIAN_FRONTEND=noninteractive pscp -h ~/.pssh/wrk"

alias pshgluster="DEBIAN_FRONTEND=noninteractive pssh -i -h ~/.pssh/gluster"
alias pscpgluster="DEBIAN_FRONTEND=noninteractive pscp -h ~/.pssh/gluster"

alias pshrock="DEBIAN_FRONTEND=noninteractive pssh -i -h ~/.pssh/rock"
alias pscprock="DEBIAN_FRONTEND=noninteractive pscp -h ~/.pssh/rock"

alias pshff="DEBIAN_FRONTEND=noninteractive pssh -i -h ~/.pssh/ff"
alias pscpff="DEBIAN_FRONTEND=noninteractive pscp -h ~/.pssh/ff"
