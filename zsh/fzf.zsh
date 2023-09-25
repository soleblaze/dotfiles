if type brew &>/dev/null; then
  if [ -f "$(brew --prefix fzf)/shell/key-bindings.zsh" ] ;then
    source $(brew --prefix fzf)/shell/key-bindings.zsh
  fi
  if [ -f "$(brew --prefix fzf)/shell/completion.zsh" ] ;then
    source $(brew --prefix fzf)/shell/completion.zsh
  fi
fi
if [ -f "/usr/share/fzf/key-bindings.zsh" ] ;then
  source /usr/share/fzf/key-bindings.zsh
fi
if [ -f "/usr/share/fzf/completion.zsh" ] ;then
  source /usr/share/fzf/completion.zsh
fi
