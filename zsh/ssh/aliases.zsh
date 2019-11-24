#!/bin/usr/env zsh

# =========================================================
# Just some convience commands for running the unbelievably
# useful `pssh`. It's no Ansible replacement by any means, but
# for issuing one-off commands across a cluster it hits the sweet
# spot in terms of simplicity and trasparency.

function pssh_with_hosts() {
  local hostfile=$1
  if ! test -e $hostfile; then
    echo '[ERROR]: hostfile does not exist.'
    exit 1
  fi
  shift
  pssh -i -h $hostfile "DEBIAN_FRONTEND=noninteractive $@"
}

# =========
# -- ALL --
# =========
alias pshal="pssh_with_hosts ~/.pssh/all"
alias pscpal="DEBIAN_FRONTEND=noninteractive pscp -h ~/.pssh/all"

# =========
# -- PVE --
# =========
alias pshpve="pssh_with_hosts ~/.pssh/pve-lxc"
alias pshpve3="pssh_with_hosts ~/.pssh/pve3-lxc"

# ===========
# -- RPi's --
# ===========
alias pshpis="pssh_with_hosts ~/.pssh/rpis"
alias pscppis="DEBIAN_FRONTEND=noninteractive pscp -h ~/.pssh/rpis"

# ==============
# -- Rock64's --
# ==============
alias pshrock="pssh_with_hosts ~/.pssh/rock"
alias pscprock="DEBIAN_FRONTEND=noninteractive pscp -h ~/.pssh/rock"

# -- roc-rk33288-
alias pshff="pssh_with_hosts ~/.pssh/ff"
alias pscpff="DEBIAN_FRONTEND=noninteractive pscp -h ~/.pssh/ff"

alias mosh-home='ssh -S none -o "ProxyCommand=/usr/local/bin/mosh --fake-proxy -- %h %p" -t jesse@74.71.41.142 -p 33335'
alias mh="mosh-home"
