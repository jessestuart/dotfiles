#!/usr/bin/env zsh

function gcp() {
  local GCP_ROOT="$HOME/bin/google-cloud-sdk"
  # shellcheck disable=SC1090
  test -e "$GCP_ROOT" && . "$GCP_ROOT/path.zsh.inc"
  # shellcheck disable=SC1090
  test -e "$GCP_ROOT" && . "$GCP_ROOT/completion.zsh.inc"
}
