#!/bin/bash

linkFile() {
	if ! [ -L "$2" ]; then
		ln -s "$1" "$2"
	fi
}

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

pushd nvim || exit
for i in *; do
	linkFile "$PWD/$i" "$HOME/.config/nvim/$i"
done
popd

linkFile "$PWD/linters/cbfmt.toml" ~/.cbfmt.toml
linkFile "$PWD/linters/golangci.yml" ~/.golangci.yml
linkFile "$PWD/linters/markdownlint.yaml" ~/.markdownlint.yaml

mkdir -p ~/.config/yamllint
linkFile "$PWD/linters/yamllint.yml" ~/.config/yamllint/config

linkFile "$PWD/zsh/starship.toml" ~/.config/starship.toml

if [[ $SHELL != "/usr/bin/zsh" ]]; then
	chsh -s "/usr/bin/zsh"
fi

mkdir -p ~/.cache/zsh

mkdir -p ~/.config/git/hooks
for i in hooks/*; do
	linkFile "$PWD/$i" "$HOME/.config/git/$i"
done

mkdir -p ~/.config/alacritty
linkFile "$PWD/alacritty/alacritty.yml" ~/.config/alacritty/alacritty.yml

if [ ! -d ~/.tmux/plugins/tpm ]; then
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

linkFile "$PWD/tmux/tmux.conf" ~/.tmux.conf
