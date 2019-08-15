#!/usr/bin/env zsh

NEOVIM_NIGHTLY_URL_MACOS="https://github.com/neovim/neovim/releases/download/nightly/nvim-macos.tar.gz"

function nvim_pull_nightly() {
  local SCRATCH=$(mktemp -d)
  pushd ${SCRATCH}
  curl -sL ${NEOVIM_NIGHTLY_URL_MACOS} | tar xz
  test -d /usr/local/nvim && sudo trash-put /usr/local/nvim
  sudo mv $SCRATCH/nvim-osx64 /usr/local/nvim
  popd
}

nvim_pull_nightly
