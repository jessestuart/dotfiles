#!/bin/bash
export TILLER_NAMESPACE="kube-system"

export ETCDCTL_API=3
export ETCDCTL_ENDPOINTS="https://127.0.0.1:2379"
export ETCDCTL_CACERT="/etc/etcd/ca.pem"
export ETCDCTL_CERT="/etc/etcd/kubernetes.pem"
export ETCDCTL_KEY="/etc/etcd/kubernetes-key.pem"
