#!/usr/bin/env zsh

function gcp() {
  local GCP_ROOT="$HOME/bin/google-cloud-sdk"
  # shellcheck disable=SC1090
  test -e "$GCP_ROOT" && . "$GCP_ROOT/path.zsh.inc"
  # shellcheck disable=SC1090
  test -e "$GCP_ROOT" && . "$GCP_ROOT/completion.zsh.inc"
}

function _gcpssh() {
  gcloud compute \
    --project jds-gcp \
    ssh $1 \
    --zone us-east1-b
}

function gcpssh() {
  gcp
  local vm=$1
  if test -z $vm; then vm='image-builder'; fi

  gcloud compute \
    --project jds-gcp \
    instances start $vm \
    --zone us-east1-b

  gcloud compute \
    --project jds-gcp \
    ssh $vm \
    --zone us-east1-b
}

function gcpkill() {
  gcp
  local vm=$1
  if test -z $vm; then vm='image-builder'; fi

  gcloud compute \
    --project jds-gcp \
    instances stop $vm \
    --zone us-east1-b
}
