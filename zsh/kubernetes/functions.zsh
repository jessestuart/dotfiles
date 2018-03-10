#!/usr/bin/env zsh

# ==========================================================================
# Convenience function to quickly get the CPU temp of each node in a cluster
# simply using pssh.
#
# Usage:

# ```shell
# $ ktmp
# pik8s-master     49000
# pik8s-worker1    51000
# pik8s-worker2    44546
# pik8s-worker3    41856
# pik8s-worker4    41318
# pik8s-worker5    45084
# ```
# ==========================================================================
function ktmp() {
  local remote_command='printf "%s\t\t%s\n" $(hostname) $(cat /sys/class/thermal/thermal_zone0/temp)'
  local hosts_file="$HOME/dev/pik8s/.pssh_hosts_all"

  pssh -t2 -i -h $hosts_file $remote_command | grep -v SUCCESS | sort
}
