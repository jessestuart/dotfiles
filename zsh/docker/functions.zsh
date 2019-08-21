#!/usr/bin/env zsh

# =========================
# Manifests / manifest-tool
# =========================
function mantool-inspect() {
  manifest-tool inspect $1 | grep -vi -e layer -e digest -e 'manifest type'
}

function manti() {
  local image=$1
  if ! hash reg &>/dev/null; then
    mantool-inspect $image
    return
  fi
  manifest=$(reg manifest --username=$DOCKERHUB_USERNAME --password=$DOCKERHUB_PASSWORD $image 2 &>1)
  echo "manifest: $manifest"
  # reg manifest --username=$DOCKERHUB_USERNAME --password=$DOCKERHUB_PASSWORD $image

  if ! [[ $manifest =~ .*platform.* ]]; then
    echo 'falling back to manifest tool'
    manifest-tool --username=$DOCKERHUB_USERNAME --password=$DOCKERHUB_PASSWORD inspect $image | grep -vi -e layer -e digest -e 'manifest type'
  else
    echo $manifest |
      jq '.manifests[].platform | .os, .architecture' -r |
      xargs -L2 echo
  fi
}

# ====================
# Miscellaneous Docker
# ====================

function dps() {
  if (hash rainbow &>/dev/null); then
    docker ps |
      # REmove the column headers
      tail -n+2 |
      grep -v k8s_POD |
      sed -e 's/k8s_POD_/(POD) /g' |
      # Highlight container name/id in green
      # Highlight 'Exited' containers in red
      # Highlight kubernetes-managed "k8s_POD` containers
      rainbow -g '^[a-zA-Z0-9]+' -r 'Exited' -y '\(POD\)'
  else
    docker ps | grep -v POD
  fi
}

function dpa() {
  if (hash rainbow &>/dev/null); then
    docker ps -a |
      # REmove the column headers
      tail -n+2 |
      sed -e 's/k8s_POD_/(POD) /g' |
      # Highlight container name/id in green
      # Highlight 'Exited' containers in red
      # Highlight kubernetes-managed "k8s_POD` containers
      rainbow -g '^[a-zA-Z0-9]+' -r 'Exited' -y '\(POD\)'
  else
    docker ps -a
  fi
}

function dki() {
  local image=$1
  local org=$(echo $image | cut -d'/' -f1)
  local repo=$(echo $image | cut -d'/' -f2)
  echo '============================================='
  echo 'MANIFEST:'
  echo '============================================='
  manti $image | rg --color=never Arch
  if ! (echo $image | grep -q "/" &>/dev/null); then
    image = "library/$image"
  fi

  echo '============================================='
  echo 'TAGS:'
  echo '============================================='
  local dh_json=$(docker-hub tags -o $org -r $repo -f json)
  docker-hub tags -o $org -r $repo -f json |
    jq -r '.[] | ."Name", ."Size", ."Last updated"' |
    sed -e 's/\([0-9]*\)\s*\([MKG]B\)/\1\2/' -e 's/[0-9]*\:[0-9]*//' |
    xargs -n3 echo |
    sort -k3r |
    column -t
}

function dkir() {
  local images=$(docker images)
  for image in $(dps | tail -n+2 | awk2); do
    local image=$(echo $image | sed 's/:\(.*-\)*latest//')
    local image_id=$(echo $images | grep $image | head -n1 | awk1)
    test -z $image_id || echo $image_id
  done
}

# ===============
# Docker Machine
# ===============
# Set Docker Machine environment
function dkme() {
  if ((!$ + commands[docker - machine])); then
    return 1
  fi

  eval $(docker-machine env $1)
}

# Set Docker Machine default machine
function dkmd() {
  if ((!$ + commands[docker - machine])); then
    return 1
  fi

  pushd ~/.docker/machine/machines

  if [[ ! -d $1 ]]; then
    echo "Docker machine '$1' does not exists. Abort."
    popd
    return 1
  fi

  if [[ -L default ]]; then
    eval $(rm -f default)
  elif [[ -d default ]]; then
    echo "A default manchine already exists. Abort."
    popd
    return 1
  elif [[ -e default ]]; then
    echo "A file named 'default' already exists. Abort."
    popd
    return 1
  fi

  eval $(ln -s $1 default)
  popd
}

# ==============
# docker-hub CLI
# ==============
function dhr() {
  local organization=$1
  shift
  docker-hub repos -o $organization $@
}

function dht() {
  if $(echo $1 | grep -q '/'); then
    repo=$(echo $1 | cut -d'/' -f1)
    image=$(echo $1 | cut -d'/' -f2)
  else
    repo='library'
    image=$1
  fi
  if ! test -z $2; then page_num=$2; else page_num=1; fi
  docker-hub tags -o $repo -r $image -p $page_num
}

function djt() {
  image=$1
  page_num=1
  if ! test -z $2; then page_num=$2; fi
  docker-hub tags -o jessestuart -r $image -p $page_num
}

function mantp() {
  local registry=jessestuart
  local image=$1
  local version=$2
  local platforms=$3
  local target=$4
  manifest-tool \
    --username $DOCKERHUB_USERNAME --password $DOCKERHUB_PASSWORD \
    push from-args \
    --platforms "$platforms" \
    --template "$registry/$image:$version-ARCH" \
    --target "$registry/$image:$target"
}

# function mantp() {
#   local registry=jessestuart
#   local image=$1
#   local version=$2
#   local platforms=$3
#   local target=$4
#   manifest-tool \
#     --username $DOCKERHUB_USERNAME --password $DOCKERHUB_PASSWORD \
#     push from-args \
#     --platforms "$platforms" \
#     --template "$registry/$image:$version-ARCH" \
#     --target "$registry/$image:$target"
# }

function dhtags() {
  image=$1
  skopeo inspect docker://docker.io/$image | jq '.RepoTags[]' -r | rg --color=never '^(v)?[0-9]+\.[0-9]+\.[0-9]+' | sort --version-sort
}
