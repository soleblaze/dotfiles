#!/bin/zsh

# Doing Aliases
# https://github.com/ttscoff/doing
if  [ $commands[doing] ]; then
  alias dn="doing now"
  alias ddone="doing done"
  alias dl="doing last"
  alias dnext="doing done; doing now"
  alias dt="doing today --totals"
  alias dy="doing yesterday --totals"
fi
