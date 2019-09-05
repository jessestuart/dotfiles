#!/usr/bin/env zsh

function pctstop() {
  for node in $(pct list | grep running | awk1); do
    echo "Stopping node $node..."
    pct stop $node
  done
}

function pct-enter-all() {
  xpanes -t -c "pct enter {}" $(pct list | rg running | awk1)
}
