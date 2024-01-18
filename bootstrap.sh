#!/bin/bash

linkFile() {
  if ! [ -L "$2" ]; then
    ln -s "$1" "$2"
  fi
}

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

mkdir -p ~/.config/kitty

for i in kitty/*; do
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

linkFile "$PWD/foot" "$HOME/.config/foot"
linkFile "$PWD/fuzzel" "$HOME/.config/fuzzel"
linkFile "$PWD/sway" "$HOME/.config/sway"
linkFile "$PWD/waybar" "$HOME/.config/waybar"

linkFile "$PWD/systemd/dunst.service" "$HOME/.config/systemd/user/dunst.service"
linkFile "$PWD/systemd/sway-session.target" "$HOME/.config/systemd/user/sway-session.target"
