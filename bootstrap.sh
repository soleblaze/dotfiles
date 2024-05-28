#!/bin/bash
GH_EXTENSIONS=(
  HaywardMorihara/gh-tidy
  dlvhdr/gh-dash
  gennaro-tedesco/gh-f
  github/gh-copilot
  seachicken/gh-poi
)
# extensions to look at in the future
#meiji163/gh-notify
#chelnak/gh-changelog

linkFile() {
  if ! [ -L "$2" ]; then
    ln -s "$1" "$2"
  fi
}

mkdir -p ~/bin
mkdir -p ~/.config/sway/config.d
mkdir -p ~/.config/obsidian

linkFile "$PWD/fuzzel" "$HOME/.config/fuzzel"
linkFile "$PWD/waybar" "$HOME/.config/waybar"
linkFile "$PWD/dunst" "$HOME/.config/dunst"
linkFile "$PWD/foot" "$HOME/.config/foot"
linkFile "$PWD/chromium/chromium-flags.conf" "$HOME/.config/chromium-flags.conf"
linkFile "$PWD/obsidian/user-flags.conf" "$HOME/.config/obsidian/user-flags.conf"

linkFile "$PWD/sway/config" "$HOME/.config/sway/config"
for i in "$PWD/sway/config.d/"*; do
  linkFile "$i" "$HOME/.config/sway/config.d/$(basename "$i")"
done

mkdir -p ~/.config/systemd/user
for i in "$PWD/systemd/"*; do
  linkFile "$i" "$HOME/.config/systemd/user/$(basename "$i")"
done

for i in "$PWD/bin/"*; do
  linkFile "$i" "$HOME/bin/$(basename "$i")"
done

mkdir -p ~/.config/qutebrowser
linkFile "$PWD/qutebrowser/config.py" "$HOME/.config/qutebrowser/config.py"

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
linkFile "$PWD/linters/markdownlintrc" ~/.markdownlintrc

mkdir -p ~/.config/yamllint
linkFile "$PWD/linters/yamllint.yml" ~/.config/yamllint/config

mkdir -p ~/.cache/zsh

echo "Installing Github Extensions"
for i in "${GH_EXTENSIONS[@]}"; do
  if gh extension list | grep -q "$i"; then
    gh extension upgrade "$i"
    continue
  fi
  gh extension install "$i"
done

linkFile "$PWD/bin/tmux-switch-sessions.sh" "$HOME/bin/tmux-switch-sessions.sh"
linkFile "$PWD/tmux/tmux.conf" "$HOME/.tmux.conf"

if ! [ -d "$HOME/.tmux/plugins/tpm" ]; then
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi
