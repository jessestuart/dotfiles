#!/usr/bin/env zsh

# ==========================================================================
# Convenience function to quickly get the CPU temp of each node in a cluster
# simply using pssh.
#
# Example output:
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

function ktmps() {
  ktmp | sort -k2r
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
alias kge="get_pods_colorized --all-namespaces -owide | tail -n+2 | grep -Ev 'Running|Completed' | sort -k8 -d"
alias kgenum="kge | wc -l"

function krmerr() {
  kubectl get pods --all-namespaces -owide | tail -n+2 | grep -v Running | grep -v Completed |
    while read err_pod; do
      local namespace=$(echo $err_pod | awk1)
      local podname=$(echo $err_pod | awk2)
      kubectl --namespace $namespace delete pod $podname
    done
}

function krmcomp() {
  kgpw | grep Completed | while read err_pod; do
    local namespace=$(echo $err_pod | awk1)
    local podname=$(echo $err_pod | awk2)
    nohup kubectl --namespace $namespace delete pod $podname &
  done
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

# =========================================================================
# "kglb": Pretty-print all LoadBalancer services.
# ----------------------------------------------
# Generate a table of all LoadBalancer services, ordered by IP (ascending),
# and with service name and service namespace in the second and third columns.
#
# Example output:
# ```console
# 10.10.10.10  coredns                           kube-system
# 10.10.10.10  coredns-tcp                       kube-system
# 10.10.10.11  cerebro                           logging
# 10.10.10.12  elasticsearch-hq                  logging
# 10.10.10.13  traefik-consul-ui                 kube-system
# 10.10.10.14  elasticsearch                     logging
# 10.10.10.15  grafana                           monitoring
# 10.10.10.16  prometheus                        monitoring
# 10.10.10.17  stash                             stash
# 10.10.10.18  kibana                            logging
# 10.10.10.20  traefik-external                  kube-system
# 10.10.10.21  traefik                           kube-system
# ```
# =========================================================================
function kglb() {
  kubectl get svc --all-namespaces |
    grep LoadBalancer |
    awk '{print $5,$2,$1}' |
    sort -k1 -d |
    column -t
}

function krg() {
  kgpw | rg $1
}

# kubectl() {
#   # shellcheck disable=SC1090,SC2039
#   source <(command kubectl completion zsh)
#   # eval "$(command kubectl $@)"
#   command kubectl "$@"
# }
