
if [ "$(uname -o)" == "GNU/Linux" ] && grep -q Arch /etc/*release 2>&1 >/dev/null; then
  source /usr/share/fzf/completion.zsh
  source /usr/share/fzf/key-bindings.zsh
elif [ "$(uname -o)" == "Darwin" ]; then
  source $(brew --prefix fzf)/shell/completion.zsh
  source $(brew --prefix fzf)/shell/key-bindings.zsh
fi
