#!/bin/zsh

# Doing Aliases
# https://github.com/ttscoff/doing
if  [ $commands[doing] ]; then
  alias ddone="doing done"
  alias dl="doing last"
  alias dn="doing done; doing now"
  alias dnow="doing now"
  alias dt="doing today --totals"
  alias dy="doing yesterday --totals"
fi
