#!/usr/bin/env zsh

# ==========================================================
# See the README in this folder for more background on this.
# (WIP)
# ==========================================================
function mind() {
  # local num_args=$#
  local wiki_root="$HOME/org/wiki/cool"
  if [ $# = '0' ]; then
    $EDITOR "$wiki_root/index.md"
  else
    # TODO: Update to allow multiple args for nesting topics.
    topic=$1
    $EDITOR "$wiki_root/$topic.md"
  fi
}

