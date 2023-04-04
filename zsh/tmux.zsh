#!/bin/zsh
function set_win_title(){
    echo -ne "\033]0;$*\007"
}
function ssh() {
  if [ -n "$TMUX" ]
  then
    TERM=xterm-256color
    tmux rename-window ${@[-1]}
    set_win_title ssh ${@[-1]}

    /usr/bin/ssh $*

    tmux setw automatic-rename

  else
    /usr/bin/ssh $*
  fi
}

function sshnh() {
  if [ -n "$TMUX" ]
  then
    TERM=xterm-256color

    tmux rename-window ${@[-1]}
    set_win_title ssh ${@[-1]}

    /usr/bin/ssh -o "StrictHostKeyChecking no" -o "UserKnownHostsFile /dev/null" $*

    tmux setw automatic-rename

  else
    /usr/bin/ssh -o "StrictHostKeyChecking no" -o "UserKnownHostsFile /dev/null" $*
  fi
}
