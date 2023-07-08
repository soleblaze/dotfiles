#!/bin/bash

linkFile() {
  if ! [ -L "$2" ]; then
    ln -s "$1" "$2"
  fi
}

download_tgz() {
  filename="$1"
  repo="$2"
  target="$3"
  if ! [ -f "$HOME/bin/$1" ]; then url="$(curl -f -sL "https://api.github.com/repos/${repo}/releases/latest" | jq -r '.assets[].browser_download_url' | grep '.tar.gz$' | grep -i "$target")" echo "Downloading: $filename" curl -sL "$url" -o "/tmp/${filename}.tgz" tar -xf "/tmp/${filename}.tgz" -C "$HOME/bin/" "${filename}" rm "/tmp/${filename}.tgz" fi
}

if ! [ -f /opt/homebrew/bin/brew ] && ! [ -f '/usr/local/bin/brew' ]; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  chmod 755 /opt/homebrew/share || chmod 755 /usr/local/share
fi

if [ -f "/opt/homebrew/bin/brew" ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
else
  eval "$(/usr/localbin/brew shellenv)"
fi
brew bundle --file Brewfile.base

if brew autoupdate status | grep -q 'Autoupdate is not configured'; then
  brew autoupdate start
fi

mkdir -p ~/.local/share

linkFile "$PWD/zsh/zshrc" ~/.zshrc
linkFile "$PWD/zsh/zshenv" ~/.zshenv

if ! [ -d ~/.config/bat ]; then
  mkdir -p ~/.config/bat/themes
  linkFile "$PWD/bat/config" ~/.config/bat/config
  git clone https://github.com/wesbos/cobalt2.git ~/.config/bat/themes/cobalt2
  bat cache --build
fi

mkdir -p ~/.config/nvim/lua

for i in chatgpt.json init.lua ftplugin snippets vim; do
  linkFile "$PWD/nvim/$i" ~/.config/nvim/$i
done

pushd "$PWD/nvim/lua" > /dev/null || exit
for i in *; do
  linkFile "$PWD/$i" "$HOME/.config/nvim/lua/$i"
done
popd > /dev/null || exit

touch ~/.config/nvim/lua/local.lua

linkFile "$PWD/linters/cbfmt.toml" ~/.cbfmt.toml
linkFile "$PWD/linters/golangci.yml" ~/.golangci.yml
linkFile "$PWD/linters/markdownlint.yaml" ~/.markdownlint.yaml

mkdir -p ~/.config/yamllint
linkFile "$PWD/linters/yamllint.yml" ~/.config/yamllint/config

linkFile "$PWD/zsh/starship.toml" ~/.config/starship.toml

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

mkdir -p ~/.cache/zsh

mkdir -p ~/.config/git/hooks
for i in hooks/*; do
  linkFile "$PWD/$i" "$HOME/.config/git/$i"
done

if [ -f "$HOME/.config/desktop.mode" ]; then
  brew bundle --file Brewfile.desktop

  mkdir -p ~/.config/karabiner
  linkFile "$PWD/karabiner/karabiner.json" ~/.config/karabiner/karabiner.json

  linkFile ~/Library/Mobile\ Documents/com~apple~CloudDocs ~/iCloud


  mkdir -p ~/.config/kitty

  for i in kitty/*; do
    linkFile "$PWD/$i" "$HOME/.config/$i"
  done


fi
