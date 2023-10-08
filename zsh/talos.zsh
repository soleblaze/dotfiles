#!/bin/zsh

if  [ $commands[talosctl] ]; then
  alias tcg="talosctl config contexts"
  alias tcu="talosctl config context"
  alias td="talosctl daskboard"
  alias tmem="talosctl memory"
fi
