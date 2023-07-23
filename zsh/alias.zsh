#!/bin/zsh

# Override Commands
alias diff="batdiff --delta"
alias dig="dog"
alias df="duf --hide-mp '*ystem*olume*,*ecovery,/dev'"
alias du="dust -b"
alias free="free -h"
alias grep="grep --color -i"
alias la="exa -a --no-time --no-user --git --group-directories-first"
alias ld="exa -D --no-time --no-user --git --group-directories-first"
alias ldl="exa -lFD --no-time --no-user --git --group-directories-first"
alias le="exa -lF --extended --no-time --no-user --git --group-directories-first"
alias ll="exa -lF --no-time --no-user --git --group-directories-first"
alias lla="exa --lFa --no-time --no-user --git --group-directories-first"
alias ls="exa --no-time --no-user --git --group-directories-first"
alias lsize="exa -lF --no-time --no-user --git --group-directories-first --sort=size"
alias lt="exa -lF --no-user --git --group-directories-first"
alias man="batman"
alias pretty="prettybat"
alias ping='prettyping --nolegend'
alias sed='gsed'
alias vi="nvim"
alias watch='viddy'
alias wget=wget --hsts-file="$HOME/.local/share/wget-hsts"

# Ripgrep Aliases
alias rg="batgrep -S"
alias rgi="batgrep -i"
alias rgs="batgrep -s"

# Other Aliases
alias ndu="ncdu --color dark -rr -x --exclude .git --exclude node_modules"
alias sih="sudo -i -H"
alias svi="sudo -e"
alias sz="source ~/.zshrc"

# python aliases
alias va='source .venv/bin/activate'
alias vd='deactivate'

# bat aliases
alias cat='bat -p --pager=never'
alias catl='bat --pager=never'
alias catp='bat'

# ssh aliases
alias scpnh='scp -o "StrictHostKeyChecking no" -o "UserKnownHostsFile /dev/null"'
alias ssh='kitty +kitten ssh'
alias sshnh='kitty +kitten ssh -o "StrictHostKeyChecking no" -o "UserKnownHostsFile /dev/null"'

# dot aliases
alias -g ...="../.."
alias -g ....="../../.."
alias -g .....="../../../.."

# Misc bat aliases
alias bathelp='bat --plain --language=help'
alias bl="bat --paging=never -l log"
alias tf="tail -f | bat --paging=never -l log"
function help() {
  "$@" --help 2>&1 | bathelp
}

# colima
if which colima 2>&1 >/dev/null; then
  if [ "$(uname -m)" == "arm64" ]; then
    if /Volumes/Macintosh\ HD/usr/sbin/system_profiler SPHardwareDataType | grep -q Ultra; then
      alias cs='colima start --arch aarch64 --vm-type=vz --vz-rosetta --cpu 12 --memory 42'
    else
      alias cs='colima start --arch aarch64 --vm-type=vz --vz-rosetta --cpu 2 --memory 4'
    fi
  else
    alias cs='colima start --cpu 2 --memory 4'
  fi
  alias cstop='colima stop'
fi

# Arch Linux
if grep -q Arch /etc/*release 2>&1 >/dev/null; then
  alias pac="sudo pacman -S"
  alias pacq="pacman -Q"
  alias pacr="sudo pacman -Rs"
  alias pacs="pacman -Ss"
  alias pacsy="sudo pacman -Sy"
  alias pacsyu="sudo pacman -Syu"
  alias pacu="sudo pacman -U"
  alias pacz="pacman -Slq | fzf --multi --preview 'pacman -Si {1}' | xargs -ro sudo pacman -S"
  alias pacrz="pacman -Qq | fzf --multi --preview 'pacman -Qi {1}' | xargs -ro sudo pacman -Rns"
  alias ya="yay -S"
  alias yas="yay -Ss"
  alias yau="yay -Su"
  alias bdf="btrfs filesystem df"
fi
