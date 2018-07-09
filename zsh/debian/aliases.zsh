#!/usr/bin/env zsh

# Search for a given package, including matches within package description.
alias apts="apt search"
# Search for a given package, based only package name only.
alias aptsn="apt search --names-only"

# Install a package.
alias apti="sudo apt install -yq"
# Pull latest package updates available, and list packages eligible for upgrade.
alias aptup="sudo apt update && apt list --upgradeable"
# Upgrade all packages.
alias aptupg="sudo apt upgrade -yq"
