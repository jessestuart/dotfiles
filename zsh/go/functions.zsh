#!/usr/bin/env zsh

function go_install_latest() {
  # Just assume Linux amd64 for now.
  local OS="$(uname)"
  local arch=amd64
  local latest_release=$(curl https://golang.org/VERSION?m=text)
  echo "$OS $arch $latest_release"
}
