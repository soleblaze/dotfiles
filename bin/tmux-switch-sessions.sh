#!/usr/bin/env bash

basepath="${HOME}/git"

if [[ $# -eq 1 ]]; then
  selected=$1
else
  selected=$(find "$basepath" -mindepth 1 -maxdepth 2 -type d -name .git | sed 's|'"${basepath}"'/\(.*\)/.git|\1|' | fzf)
fi

if [[ -z $selected ]]; then
  exit 0
fi

selected_name="${selected##*/}"
selected_path="${basepath}/${selected}"
tmux_running=$(pgrep tmux)

if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
  tmux new-session -s "$selected_name" -c "$selected_path" nvim
  exit 0
fi

if ! tmux has-session -t="$selected_name" 2> /dev/null; then
  tmux new-session -ds "$selected_name" -c "$selected_path" nvim
  tmux new-window -dt "$selected_name" -c "$selected_path" -n "shell"
fi

tmux switch-client -t "$selected_name"
