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
alias dl='docker logs'

alias k3l='k3d cluster list'

function dshell() {
  docker exec -it $1 /bin/bash
}

function k3c() {
  if [ -z "$1" ]; then
    echo "Usage: k3c <cluster-name>"
    return 1
  fi

  k3d cluster create $1

  while true; do
    if kubectl get nodes --no-headers 2>&1 | grep -q "couldn't get resource list"; then
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
