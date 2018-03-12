#!/usr/bin/env zsh

function pi-ledup() {
  pssh -i -h ~/dev/pik8s/.pssh_hosts_rpis 'sudo ~/bin/llctl fs ls ds'
}

function pi-leddown() {
  pssh -i -h ~/dev/pik8s/.pssh_hosts_rpis 'sudo ~/bin/llctl f0 l0 d0'
}
