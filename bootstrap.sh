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
if [ "$(uname -a)" == "Darwin" ]; then
  mkdir -p ~/.hammerspoon
  linkFile "$PWD/macos/hammerspoon/init.lua" "$HOME/.hammerspoon/init.lua"

  mkdir -p ~/.config/karabiner
  linkFile "$PWD/macos/karabiner/karabiner.json" "$HOME/.config/karabiner/karabiner.json"

  if ! [ -f /opt/homebrew/bin/brew ]; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    chmod 755 /opt/homebrew/share
    sudo softwareupdate --install-rosetta
  fi

  eval "$(/opt/homebrew/bin/brew shellenv)"
  brew bundle --file ./macos/Brewfile

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
else
  mkdir -p "$HOME/.config/systemd/user"
  linkFile "$PWD/linux/fuzzel" "$HOME/.config/fuzzel"
  linkFile "$PWD/linux/sway" "$HOME/.config/sway"
  linkFile "$PWD/linux/waybar" "$HOME/.config/waybar"
  linkFile "$PWD/linux/systemd/dunst.service" "$HOME/.config/systemd/user/dunst.service"
  linkFile "$PWD/linux/systemd/sway-session.target" "$HOME/.config/systemd/user/sway-session.target"
  linkFile "$PWD/linux/dunst" "$HOME/.config/dunst"
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

mkdir -p ~/.config/atuin
linkFile "$PWD/atuin/config.toml" "$HOME/.config/atuin/config.toml"

echo "Installing Github Extensions"
for i in "${GH_EXTENSIONS[@]}"; do
  if gh extension list | grep -q "$i"; then
    gh extension upgrade "$i"
    continue
  fi
  gh extension install "$i"
done

mkdir -p ~/bin
linkFile "$PWD/bin/tmux-switch-sessions.sh" "$HOME/bin/tmux-switch-sessions.sh"
linkFile "$PWD/tmux/tmux.conf" "$HOME/.tmux.conf"

if ! [ -d "$HOME/.tmux/plugins/tpm" ]; then
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi
