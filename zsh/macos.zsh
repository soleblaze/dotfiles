#!/bin/zsh
if [ "$(uname -o)" == "Darwin" ]; then
# colima
  if [ "$(uname -m)" == "arm64" ]; then
    if /Volumes/Macintosh\ HD/usr/sbin/system_profiler SPHardwareDataType | grep -q Ultra; then
      alias cs='colima start --arch aarch64 --vm-type=vz --vz-rosetta --cpu 12 --memory 42'
    else
      alias cs='colima start --arch aarch64 --vm-type=vz --vz-rosetta --cpu 2 --memory 4'
    fi
  else
    alias cs='colima start --cpu 2 --memory 4'
  fi
  alias cstop='colima stop'

  source $(brew --prefix fzf)/shell/completion.zsh
  source $(brew --prefix fzf)/shell/key-bindings.zsh

  FPATH="/opt/homebrew/share/zsh-completions:$FPATH"
  FPATH="/opt/homebrew/share/zsh/site-functions:${FPATH}"

  if [ $commands[gcloud] ]; then
    source "/opt/homebrew/share/google-cloud-sdk/path.zsh.inc"
    source "/opt/homebrew/share/google-cloud-sdk/completion.zsh.inc"
  fi
fi
