alias pcd='podman context describe'
alias pci='podman context inspect'
alias pcl='podman context ls'
alias pcu='podman context use'
alias pps='podman ps'
alias ppsa='podman ps -a'
alias ppsl='podman ps -l'
alias prmi='podman rmi'
alias prun='podman run'
alias pexec='podman exec -it'
alias pl='podman logs'

function pshell() {
  podman exec -it $1 /bin/bash
}
