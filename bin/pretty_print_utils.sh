#!/usr/bin/env zsh

# =============================
# Some basic utility functions.
# =============================
function cmd_missing() {
  ! hash "$1" &>/dev/null
}

function print_header() {
  echo '============================'
  echo "$1"
  echo '============================'
}

function print_progress() {
  echo "-- $1"
}

# =======
# COLORS!
# =======
[[ "$COLORTERM" == (24bit|truecolor) || "${terminfo[colors]}" -eq '16777216' ]] || zmodload zsh/nearcolor
