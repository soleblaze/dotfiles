#!/bin/zsh

# Set Variables
export BROWSER=chromium-browser
export EDITOR=nvim

# Set Path
export GOBIN="$HOME/go/bin"
export PATH="$HOME/.local/bin:$HOME/.gem/ruby/2.5.0/bin:$HOME/bin:$PATH:$GOBIN"
export PATH="$PATH:/snap/bin:$HOME/.yarn/bin"
export PATH="${PATH}:${HOME}/.krew/bin"
export GOPATH="$HOME/go"

function lsf() {
  find ${1-.} -maxdepth 1 -type f -a ! -iname '\.*' | sed 's|^\./||' | xargs -r ls --color=auto -CFh
}
function lsfaa() {
  find ${1-.} -maxdepth 1 -type f -a -iname '\.*' | sed 's|^\./||' | xargs -r ls --color=auto -CFh
}
function lsfa() {
  find ${1-.} -maxdepth 1 -type f | sed 's|^\./||' | xargs -r ls --color=auto -CFh
}

# Ubuntu PKG Management
alias aptc="sudo apt autoclean"
alias aptd="sudo apt update && sudo apt dist-upgrade"
alias aptg="sudo apt update && sudo apt upgrade"
alias apti="sudo apt install"
alias aptr="sudo apt remove"
alias apts="apt search"
alias aptu="sudo apt update"

# Highlight a specific search and pipe it through less
alias hla='ack-grep -i --passthru --color --pager="less -R"'

# Only show the matching lines, highlighted with a color
alias hl='ack-grep -i --color --pager="less -R"'

# Find a specific keyword in all files in current directory and highlight it

function shl() {
    searchfor="$1"
    if [ "$2" ]; then
        highlight="$2"
    else
        highlight="$1"
    fi

    find . -type f -exec egrep -i "$searchfor" {} /dev/null \; | ack-grep -i --passthru --color --pager="less -R" "$highlight"
}

# BTRFS DF alias
alias bdf="btrfs filesystem df"

# Useful when copying files on a COW-enabled file system
alias cp="cp -i --reflink=auto"

# Other aliases
alias open="xdg-open"
alias xqf="xdg-mime query filetype"
alias xqd="xdg-mime query default"
alias xd="xdg-mime default"
alias irc='TERM=tmux-256color weechat-curses'

eval $(dircolors ~/.dircolors)

# Enable command not found for zsh
source /etc/zsh_command_not_found
