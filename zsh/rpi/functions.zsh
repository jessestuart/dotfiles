#!/usr/bin/env zsh

function pi-ledup() {
  pssh -i -h ~/.pssh/rpis 'sudo ~/bin/llctl fs ls ds'
}

function pi-leddown() {
  pssh -i -h ~/.pssh/rpis 'sudo ~/bin/llctl f0 l0 d0'
}
