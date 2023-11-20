#!/bin/bash

linkFile() {
  if ! [ -L "$2" ]; then
    ln -s "$1" "$2"
  fi
}

if [ "$(uname -o)" == "Darwin" ]; then

  if ! [ -f /opt/homebrew/bin/brew ] && ! [ -f '/usr/local/bin/brew' ]; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    chmod 755 /opt/homebrew/share || chmod 755 /usr/local/share
  fi

  if [ -f "/opt/homebrew/bin/brew" ]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
  else
    eval "$(/usr/localbin/brew shellenv)"
  fi
  brew bundle --file Brewfile

  if brew autoupdate status | grep -q 'Autoupdate is not configured'; then
    brew autoupdate start
  fi

  mkdir -p ~/.docker/cli-plugins
  linkFile "$(brew --prefix)/bin/docker-buildx" ~/.docker/cli-plugins/docker-buildx

  if ! [ -e "$HOME/.docker/scan/config.json" ]; then
    mkdir -p ~/.docker/scan
    echo "{}" > ~/.docker/scan/config.json
  fi

  if ! grep -q "$(brew --prefix)/bin/zsh" /etc/shells; then
    echo "Adding $(brew --prefix)/bin/zsh to /etc/shells"
    echo "$(brew --prefix)/bin/zsh" | sudo tee -a /etc/shells
  fi

  if [[ $SHELL != "$(brew --prefix)/bin/zsh" ]]; then
    echo "Changing shell to $(brew --prefix)/bin/zsh"
    chsh -s "$(brew --prefix)/bin/zsh"
  fi

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

mkdir -p ~/.config/git/hooks
for i in hooks/*; do
  linkFile "$PWD/$i" "$HOME/.config/git/$i"
done

linkFile "$PWD/tmux/tmux.conf" "$HOME/.tmux.conf"

if ! [ -d "$HOME/.tmux/plugins/tpm" ]; then
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

if [ "$SETUP_AI" == "true" ]; then
  if [ "$(uname -o)" == "Darwin" ]; then
    brew tap appleboy/tap
    brew install codegpt

    brew tap k8sgpt-ai/k8sgpt
    brew install k8sgpt
    #else
    # TODO: Add Linux installation for k8sgpt and codegpt
  fi

  pipx install shell-gpt
fi
