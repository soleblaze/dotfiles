#!/bin/bash

linkFile() {
  if ! [ -L "$2" ]; then
    ln -s "$1" "$2"
  fi
}

installKrewPlugin() {
  if ! [ -f "$HOME/.krew/bin/kubectl-${1/-/_}" ]; then
    kubectl krew install "$1"
  fi
}

installGHExtension() {
  if ! [ -d "$HOME/.local/share/gh/extensions/${1##*/}" ]; then
    gh extension install "$1"
  fi
}

download_tgz() {
  filename="$1"
  repo="$2"
  target="$3"
  if ! [ -f "$HOME/bin/$1" ]; then
    url="$(curl -f -sL "https://api.github.com/repos/${repo}/releases/latest" | jq -r '.assets[].browser_download_url' | grep '.tar.gz$' | grep -i "$target")"
    echo "Downloading: $filename"
    curl -sL "$url" -o "/tmp/${filename}.tgz"
    tar -xf "/tmp/${filename}.tgz" -C "$HOME/bin/" "${filename}"
    rm "/tmp/${filename}.tgz"
  fi
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
brew bundle

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

linkFile ~/Library/Mobile\ Documents/com~apple~CloudDocs ~/iCloud

# Disable ApplePressandHold
defaults write -g ApplePressAndHoldEnabled -bool false

linkFile "$PWD/linters/cbfmt.toml" ~/.cbfmt.toml
linkFile "$PWD/linters/golangci.yml" ~/.golangci.yml
linkFile "$PWD/linters/markdownlint.yaml" ~/.markdownlint.yaml

mkdir -p ~/.config/yamllint
linkFile "$PWD/linters/yamllint.yml" ~/.config/yamllint/config

mkdir -p ~/.config/vale
linkFile "$PWD/linters/vale.ini" ~/.config/vale/vale.ini
vale sync --config ~/.config/vale/vale.ini

linkFile "$PWD/zsh/starship.toml" ~/.config/starship.toml

mkdir -p ~/.docker/cli-plugins
linkFile "$(brew --prefix)/bin/docker-buildx" ~/.docker/cli-plugins/docker-buildx

if ! [ -e "$HOME/.docker/scan/config.json" ]; then
  mkdir -p ~/.docker/scan
  echo "{}" >~/.docker/scan/config.json
fi

linkFile "$PWD/tmux/tmux.conf" ~/.tmux.conf
if ! [ -f ~/.tmux/plugins/tpm/bin/install_plugins ]; then
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
  ~/.tmux/plugins/tpm/bin/install_plugins
fi

mkdir -p ~/bin
for file in bin/*; do
  linkFile "$PWD/$file" "$HOME/$file"
done

if ! [[ -f "$HOME/.terminfo/74/tmux-256color" ]]; then
  tic -x "$PWD/terminfo/tmux-256color.terminfo"
fi

mkdir -p ~/.hammerspoon
linkFile "$PWD/hammerspoon/init.lua" ~/.hammerspoon/init.lua

if ! grep -q "$(brew --prefix)/bin/zsh" /etc/shells; then
  echo "Adding $(brew --prefix)/bin/zsh to /etc/shells"
  echo "$(brew --prefix)/bin/zsh" | sudo tee -a /etc/shells
fi

if [[ "$SHELL" != "$(brew --prefix)/bin/zsh" ]]; then
  echo "Changing shell to $(brew --prefix)/bin/zsh"
  chsh -s "$(brew --prefix)/bin/zsh"
fi

mkdir -p ~/.cache/zsh

mkdir -p ~/.config/smug

for i in smug/*; do
  linkFile "$PWD/$i" "$HOME/.config/$i"
done

mkdir -p ~/.config/git/hooks
for i in hooks/*; do
  linkFile "$PWD/$i" "$HOME/.config/git/$i"
done

if ! grep -q "hookPath" ~/.gitconfig; then
  git config --global core.hooksPath "$HOME/.config/git"
fi

installKrewPlugin blame
installKrewPlugin debug-shell
installKrewPlugin df-pv
installKrewPlugin exec-as
installKrewPlugin fuzzy
installKrewPlugin gadget
installKrewPlugin ice
installKrewPlugin images
installKrewPlugin kluster-capacity
installKrewPlugin kurt
installKrewPlugin modify-secret
installKrewPlugin node-shell
installKrewPlugin oomd
installKrewPlugin outdated
installKrewPlugin pod-inspect
installKrewPlugin resource-capacity
installKrewPlugin score
installKrewPlugin sick-pods
installKrewPlugin sniff
installKrewPlugin starboard
installKrewPlugin status
installKrewPlugin stern
installKrewPlugin tree
installKrewPlugin view-allocations

if [[ "$(uname -m)" == "arm64" ]]; then
  download_tgz kubecolor hidetatz/kubecolor Darwin_arm64
else
  download_tgz kubecolor hidetatz/kubecolor Darwin_x86_64

  installKrewPlugin kubescape
  installKrewPlugin service-tree
  installKrewPlugin doctor
  installKrewPlugin view-webhook
  installKrewPlugin strace
  installKrewPlugin tap
  installKrewPlugin trace
  installKrewPlugin podevents
  installKrewPlugin popeye
  installKrewPlugin kubesec-scan
  installKrewPlugin pod-dive
  installKrewPlugin flame
fi

installGHExtension gennaro-tedesco/gh-f
installGHExtension dlvhdr/gh-dash
