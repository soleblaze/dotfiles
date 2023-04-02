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
