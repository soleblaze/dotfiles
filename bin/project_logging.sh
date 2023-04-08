#!/bin/bash

if [ "$TMUX" ] && [ "$PROJECT" ]; then
  WINDOW=$(tmux display-message -p '#{window_index}')
  DIR="$HOME/PROJECTS/${PROJECT}/logs/"
  LOGFILE="${DIR}/#{session_name}W#{window_index}-P#{pane_index}.%Y%m%dT%H%M%S.log"
  mkdir -p "${DIR}"

  if [[ ${WINDOW} -gt 3 ]]; then
    tmux pipe-pane -o "cat | ansifilter >>$LOGFILE"
  fi
fi
