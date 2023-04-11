#!/bin/zsh

# Strip comments and empty lines out of a file
function catnc() {
    grep -E -v '(^#|^/)' "$1" | sed '/^$/d'
}

function diff() {
  if [ "$#" -ne 2 ]; then
    command diff "$@"
    return
  fi

  git diff --no-index $1 $2;
}

function cdgb() {
  if git rev-parse --show-toplevel >/dev/null 2>&1; then
    cd $(git rev-parse --show-toplevel)
  else
    echo "Not in a git repo."
  fi
}
