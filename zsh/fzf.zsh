if [ -d "/home/linuxbrew/.linuxbrew/var/homebrew/linked/fzf/shell" ]; then
  source /home/linuxbrew/.linuxbrew/var/homebrew/linked/fzf/shell/key-bindings.zsh
  source /home/linuxbrew/.linuxbrew/var/homebrew/linked/fzf/shell/completion.zsh
elif [ -d "/usr/share/fzf/shell" ]; then
  source /usr/share/fzf/shell/key-bindings.zsh
fi
