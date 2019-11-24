#!/bin/bash
export TILLER_NAMESPACE="kube-system"

export ETCDCTL_API=3
export ETCDCTL_ENDPOINTS="https://127.0.0.1:2379"
export ETCDCTL_CACERT="/etc/etcd/ca.pem"
export ETCDCTL_CERT="/etc/etcd/kubernetes.pem"
export ETCDCTL_KEY="/etc/etcd/kubernetes-key.pem"

if test "$(uname)" = 'Darwin'; then
  export HELM_PLUGINS="/Users/jesse/Library/helm/plugins"
  export HELM_REGISTRY_CONFIG="/Users/jesse/Library/Preferences/helm/registry.json"
  export HELM_REPOSITORY_CACHE="/Users/jesse/Library/Caches/helm/repository"
  export HELM_REPOSITORY_CONFIG="/Users/jesse/Library/Preferences/helm/repositories.yaml"
  export HELM_KUBECONTEXT="kubernetes-admin@kubernetes"
  export HELM_BIN="helm"
  export HELM_DEBUG="false"
fi
