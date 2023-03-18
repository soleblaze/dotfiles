if [ -f "$(brew --prefix fzf)/shell/key-bindings.zsh" ] ;then
  source $(brew --prefix fzf)/shell/key-bindings.zsh
fi
if [ -f "$(brew --prefix fzf)/shell/completion.zsh" ] ;then
  source $(brew --prefix fzf)/shell/completion.zsh
fi
