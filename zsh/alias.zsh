#!/bin/zsh

# Override Commands
alias diff="batdiff --delta"
alias df="duf --hide-mp '*ystem*olume*,*ecovery,/dev'"
alias du="dust -b"
alias free="free -h"
alias grep="grep --color -i"
alias la="eza -a --no-time --no-user --git --group-directories-first"
alias ld="eza -D --no-time --no-user --git --group-directories-first"
alias ldl="eza -lFD --no-time --no-user --git --group-directories-first"
alias le="eza -lF --extended --no-time --no-user --git --group-directories-first"
alias ll="eza -lF --no-time --no-user --git --group-directories-first"
alias lla="eza --lFa --no-time --no-user --git --group-directories-first"
alias ls="eza --no-time --no-user --git --group-directories-first"
alias lsize="eza -lF --no-time --no-user --git --group-directories-first --sort=size"
alias lt="eza -lF --no-user --git --group-directories-first"
alias lu="eza -glF --git --group-directories-first"
alias man="batman"
alias pretty="prettybat"
alias ping='prettyping --nolegend'
alias vi="nvim"
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
alias catl='bat --style header,snip,grid --pager=never'
alias catp='bat --style header,snip,grid'

# ssh aliases
alias scpnh='scp -o "StrictHostKeyChecking no" -o "UserKnownHostsFile /dev/null"'
alias sshnh='ssh -o "StrictHostKeyChecking no" -o "UserKnownHostsFile /dev/null"'

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
