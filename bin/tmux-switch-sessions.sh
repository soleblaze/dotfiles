#!/usr/bin/env bash

if [[ $# -eq 1 ]]; then
  selected=$1
else
  selected=$(find ~/git ~/work -mindepth 1 -maxdepth 3 -type d -name .git | sed 's|'"${HOME}"'/\(.*\)/.git|\1|' | fzf-tmux -p --reverse -1 -0 +m)
fi

if [[ -z $selected ]]; then
  exit 0
fi

selected_name="${selected##*/}"
selected_path="${HOME}/${selected}"
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
