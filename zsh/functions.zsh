#!/bin/zsh

# Strip comments and empty lines out of a file
function catnc() {
    grep -E -v '(^#|^/)' "$1" | sed '/^$/d'
}

# uses batcat for diff. This is done in a function since columns isn't working
# properly in blink shell
function diff() {
  batdiff --delta --terminal-width=$(($COLUMNS-1)) $1 $2
}


function cdgr() {
  if git rev-parse --show-toplevel >/dev/null 2>&1; then
    cd $(git rev-parse --show-toplevel)
  else
    echo "Not in a git repo."
  fi
}
