#!/bin/zsh

if [ "$TMUX" ] && [ "$PROJECT" ]; then
  WINDOW=$(tmux display-message -p '#{window_index}')
  DIR="$HOME/PROJECTS/${PROJECT}/logs/"
  LOGFILE="${DIR}/#{session_name}W#{window_index}-P#{pane_index}.%Y%m%dT%H%M%S.log"
  mkdir -p "${DIR}"

  if [[ ${WINDOW} -gt 3 ]]; then
    tmux pipe-pane -o "cat | ansifilter >>$LOGFILE"
  fi
fi

alias op='find ~/projects -mindepth 1 -maxdepth 1 -type d -exec basename {} \; | fzf --print0 | xargs -0 -I {} -n 1 -o select_project.sh {}'

function cproj() {
  if ! [[ "$1" ]]; then
    echo "Error: no project name given"
  else
    ~/bin/select_project.sh "$1"
  fi
}
