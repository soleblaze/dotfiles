alias dcd='docker context describe'
alias dci='docker context inspect'
alias dcl='docker context ls'
alias dcu='docker context use'
alias dps='docker ps'
alias dpsa='docker ps -a'
alias dpsl='docker ps -l'
alias drmi='docker rmi'
alias drun='docker run'
alias dexec='docker exec -it'

alias k3l='k3d cluster list'

function dshell() {
  docker exec -it $1 /bin/bash
}

function dtun() {
  PORTS=()
  machine=$(docker context inspect | jq -r '.[].Endpoints.docker.Host | sub("ssh://"; "")')
  for container in $(docker container ls -q); do
    PORTS+=($(docker port $container | awk -F "0:" '{printf $2}'))
  done
  echo Tunneling: ${PORTS}
  ssh -f "$machine" $(for port in "${PORTS[@]}"; do echo " -NL $port:127.0.0.1:$port "; done)
}

function ftun() {
  if [ -z "$1" ]; then
    echo "Usage: ftun <port>"
    return 1
  fi
  machine=$(docker context inspect | jq -r '.[].Endpoints.docker.Host | sub("ssh://"; "")')
  ssh -f -NL $1:127.0.0.1:$1 $machine
}

function ktun(){
  machine=$(docker context inspect | jq -r '.[].Endpoints.docker.Host | sub("ssh://"; "")')
  ssh -O exit $machine
}

function rtun() {
  if [ -z "$1" ]; then
    echo "Usage: rtun <port>"
    return 1
  fi
  machine=$(docker context inspect | jq -r '.[].Endpoints.docker.Host | sub("ssh://"; "")')
  ssh -f -NR $1:127.0.0.1:$1 $machine
}

function k3c() {
  if [ -z "$1" ]; then
    echo "Usage: k3c <cluster-name>"
    return 1
  fi

  machine=$(docker context inspect | jq -r '.[].Endpoints.docker.Host | sub("ssh://"; "")')
  ssh -O exit $machine
  k3d cluster create $1
  dtun

  while true; do
    if kubectl get nodes --no-headers 2>&1 | grep -q E0523; then
      echo "Waiting for cluster to be ready..."
      sleep 5
    else
      break
    fi
  done
}

function k3ct() {
  if k3d cluster list --no-headers |grep -q test; then
    k3d cluster delete test
    ssh -O exit $machine
  fi

  machine=$(docker context inspect | jq -r '.[].Endpoints.docker.Host | sub("ssh://"; "")')
  k3d cluster create test
  dtun

  while true; do
    if kubectl get nodes --no-headers 2>&1 | grep -q E0523; then
      echo "Waiting for cluster to be ready..."
      sleep 5
    else
      break
    fi
  done
}

function k3del() {
  for i in $(k3d cluster list --no-headers | awk '{print $1}'); do
    k3d cluster delete $i
  done
}