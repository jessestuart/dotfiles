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
  local remote_command='printf "%s\t%s\n" $(hostname) $(cat /sys/class/thermal/thermal_zone0/temp)'
  local hosts_file="$HOME/.pssh/all"

  pssh -t10 -i -h $hosts_file $remote_command | grep -v SUCCESS | sort
}

function kmem() {
  local remote_command="free -h | head -n2 | tail -n1 | awk '{print \$7}' | xargs printf \"\$(hostname)\t\t%s\n\""
  local hosts_file="$HOME/.pssh/all"
  pssh -t10 -i -h $hosts_file $remote_command | grep -v SUCCESS | sort
}

function clustup() {
  local remote_command="uptime"
  local hosts_file="$HOME/.pssh/all"
  pssh -t10 -i -h $hosts_file $remote_command | grep -v SUCCESS | sort
}

# ======================================
# Get all dead / crashing / etc. pods :(
# ======================================
alias kgerr="get_pods_colorized --all-namespaces -owide | tail -n+2 | grep -v Running | sort -k8"
alias kge=kgerr

function krmerr() {
  kubectl get pods --all-namespaces -owide | tail -n+2 | grep -v Running | awk '{print $1,$2}' | xargs kubectl delete pod $2 -n $1
}

function ketcdctl() {
   docker run --rm -it --net host \
     -v /etc/kubernetes:/etc/kubernetes \
     "$VOLUMES" \
     jessestuart/etcd \
     etcdctl
     --cert-file /etc/kubernetes/pki/etcd/peer.crt --key-file /etc/kubernetes/pki/etcd/peer.key --ca-file /etc/kubernetes/pki/etcd/ca.crt
     --endpoints https://10.10.10.100:2379 "$@"
      # k8s.gcr.io/etcd-arm:3.1.12 \
}

# kubectl() {
#   # shellcheck disable=SC1090,SC2039
#   source <(command kubectl completion zsh)
#   command kubectl "$@"
# }
