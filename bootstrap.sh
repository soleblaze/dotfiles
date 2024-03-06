#!/bin/bash

linkFile() {
  if ! [ -L "$2" ]; then
    ln -s "$1" "$2"
  fi
}

if ! [ -d "/home/linuxbrew/.linuxbrew/bin" ]; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
  brew bundle
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

# Wayland
if [ "$1" == "wayland" ]; then
  linkFile "$PWD/foot" "$HOME/.config/foot"
  linkFile "$PWD/fuzzel" "$HOME/.config/fuzzel"
  linkFile "$PWD/sway" "$HOME/.config/sway"
  linkFile "$PWD/waybar" "$HOME/.config/waybar"
  linkFile "$PWD/systemd/dunst.service" "$HOME/.config/systemd/user/dunst.service"
  linkFile "$PWD/systemd/sway-session.target" "$HOME/.config/systemd/user/sway-session.target"
  linkFile "$PWD/dunst" "$HOME/.config/dunst"
fi

# X11
if [ "$1" == "x11" ]; then
  linkFile "$PWD/i3" "$HOME/.config/i3"
  linkFile "$PWD/i3/i3blocks.conf" "$HOME/.i3blocks.conf"
  linkFile "$PWD/picom" "$HOME/.config/picom"
  linkFile "$PWD/rofi" "$HOME/.config/rofi"
  linkFile "$PWD/alacritty" "$HOME/.config/alacritty"
  linkFile "$PWD/x11/Xresources" "$HOME/.Xresources"
  mkdir -p ~/bin
  linkFile "$PWD/bin/rofi-task" "$HOME/bin/rofi-task"
  linkFile "$PWD/dunst" "$HOME/.config/dunst"
fi
