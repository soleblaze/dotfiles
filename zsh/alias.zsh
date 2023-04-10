#!/bin/zsh

# Override Commands
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
alias ping='prettyping --nolegend'
alias vi=nvim
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

# bat aliases
alias cat='bat -p --pager=never'
alias catl='bat --pager=never'
alias catp='bat'

# ssh aliases
alias scpnh='scp -o "StrictHostKeyChecking no" -o "UserKnownHostsFile /dev/null"'
alias sshnh='ssh -o "StrictHostKeyChecking no" -o "UserKnownHostsFile /dev/null"'

# dot aliases
alias -g ...="../.."
alias -g ....="../../.."
alias -g .....="../../../.."

# colima
if [ "$(uname -m)" == "arm64" ]; then
  alias cs='colima start --arch aarch64 --vm-type=vz --vz-rosetta --cpu 2 --memory 4'
else
  alias cs='colima start --cpu 2 --memory 4'
fi
alias cstop='colima stop'
