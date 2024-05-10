#!/bin/zsh

typeset -a excluded_commands
excluded_commands=('ls' 'cd' 'echo' 'pwd', 'git', 'cat', 'bat')

function title-precmd() {
  if [ "$TMUX" ]; then
    if [[ "$PWD" == "$HOME" ]]; then
      print -n "\ekz:~\e\\"
    else
      print -n "\ekz:${PWD##*/}\e\\"
    fi
  fi
}

function title-preexec() {
    if [ "$TMUX" ]; then
      cmd_name="${1%% *}"
      if [[ ! ${excluded_commands[(r)$cmd_name]} ]]; then
        print -n "\ek${cmd_name}\e\\"
      fi
    fi
}

autoload -Uz add-zsh-hook

if [[ "$TERM" == "tmux-256color" ]]; then
  add-zsh-hook -Uz precmd title-precmd
  add-zsh-hook -Uz preexec title-preexec
fi
