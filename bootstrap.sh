#!/bin/bash

linkFile() {
  if ! [ -L "$2" ]; then
    ln -s "$1" "$2"
  fi
}

if ! [ -f /opt/homebrew/bin/brew ]; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  chmod 755 /opt/homebrew/share
fi

eval "$(/opt/homebrew/bin/brew shellenv)"
brew bundle

mkdir -p ~/.local/share

linkFile "$PWD/zsh/zshrc" ~/.zshrc
linkFile "$PWD/zsh/zshenv" ~/.zshenv
linkFile "$PWD/tmux/tmux.conf" ~/.tmux.conf
linkFile "$PWD/digrc/digrc" ~/.digrc

if ! [ -d ~/.config/bat ]; then
  mkdir -p ~/.config/bat/themes
  linkFile "$PWD/bat/config" ~/.config/bat/config
  git clone https://github.com/wesbos/cobalt2.git ~/.config/bat/themes/cobalt2
  bat cache --build
fi

if ! [ -f ~/.tmux/plugins/tpm/bin/install_plugins ]; then
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
  ~/.tmux/plugins/tpm/bin/install_plugins
fi

mkdir -p ~/.config/nvim/lua

for i in init.lua ftplugin snippets vim; do
  linkFile "$PWD/nvim/$i" ~/.config/nvim/$i
done

pushd "$PWD/nvim/lua" >/dev/null || exit
for i in *; do
  linkFile "$PWD/$i" "$HOME/.config/nvim/lua/$i"
done
popd >/dev/null || exit

touch ~/.config/nvim/lua/local.lua

mkdir -p ~/.config/karabiner
linkFile "$PWD/karabiner/karabiner.json" ~/.config/karabiner/karabiner.json

mkdir -p ~/.hammerspoon
linkFile "$PWD/hammerspoon/init.lua" ~/.hammerspoon/init.lua

linkFile ~/Library/Mobile\ Documents/com~apple~CloudDocs ~/iCloud

# Disable ApplePressandHold
defaults write -g ApplePressAndHoldEnabled -bool false

if ! [ -e "$(brew --prefix)/bin/doing" ]; then
  brew gem install doing
fi

linkFile "$PWD/linters/cbfmt.toml" ~/.cbfmt.toml
linkFile "$PWD/linters/golangci.yml" ~/.golangci.yml
linkFile "$PWD/linters/markdownlint.yaml" ~/.markdownlint.yaml

mkdir -p ~/.config/yamllint
linkFile "$PWD/linters/yamllint.yml" ~/.config/yamllint/config

mkdir -p ~/.config/vale
linkFile "$PWD/linters/vale.ini" ~/.config/vale/vale.ini
vale sync --config ~/.config/vale/vale.ini

linkFile "$PWD/zsh/starship.toml" ~/.config/starship.toml
