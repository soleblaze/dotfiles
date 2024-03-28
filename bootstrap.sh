#!/bin/bash

linkFile() {
  if ! [ -L "$2" ]; then
    ln -s "$1" "$2"
  fi
}

if ! [ -f /opt/homebrew/bin/brew ]; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  chmod 755 /opt/homebrew/share
  sudo softwareupdate --install-rosetta
fi

eval "$(/opt/homebrew/bin/brew shellenv)"
brew bundle

if brew autoupdate status | grep -q 'Autoupdate is not configured'; then
  brew autoupdate start
fi

mkdir -p ~/.docker/cli-plugins
linkFile "$(brew --prefix)/bin/docker-buildx" ~/.docker/cli-plugins/docker-buildx

if ! grep -q "$(brew --prefix)/bin/zsh" /etc/shells; then
  echo "Adding $(brew --prefix)/bin/zsh to /etc/shells"
  echo "$(brew --prefix)/bin/zsh" | sudo tee -a /etc/shells
fi

if [[ $SHELL != "$(brew --prefix)/bin/zsh" ]]; then
  echo "Changing shell to $(brew --prefix)/bin/zsh"
  chsh -s "$(brew --prefix)/bin/zsh"
fi

linkFile "$PWD/zsh/starship.toml" ~/.config/starship.toml

mkdir -p ~/.local/share

linkFile "$PWD/zsh/zshrc" ~/.zshrc
linkFile "$PWD/zsh/zshenv" ~/.zshenv

if ! [ -d ~/.config/bat ]; then
  mkdir -p ~/.config/bat/themes
  linkFile "$PWD/bat/config" ~/.config/bat/config
  git clone https://github.com/wesbos/cobalt2.git ~/.config/bat/themes/cobalt2
  bat cache --build
fi

mkdir -p ~/.config/nvim

for i in nvim/*; do
  linkFile "$PWD/$i" "$HOME/.config/$i"
done

linkFile "$PWD/linters/cbfmt.toml" ~/.cbfmt.toml
linkFile "$PWD/linters/golangci.yml" ~/.golangci.yml
linkFile "$PWD/linters/markdownlint.yaml" ~/.markdownlint.yaml

mkdir -p ~/.config/yamllint
linkFile "$PWD/linters/yamllint.yml" ~/.config/yamllint/config

mkdir -p ~/.cache/zsh

linkFile "$PWD/tmux/tmux.conf" "$HOME/.tmux.conf"

if ! [ -d "$HOME/.tmux/plugins/tpm" ]; then
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

mkdir -p ~/.hammerspoon
linkFile "$PWD/hammerspoon/init.lua" "$HOME/.hammerspoon/init.lua"

mkdir -p ~/.config/karabiner
linkFile "$PWD/karabiner/karabiner.json" "$HOME/.config/karabiner/karabiner.json"
