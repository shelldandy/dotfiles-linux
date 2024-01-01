#!/bin/bash

# APT
sudo apt update
sudo apt upgrade
sudo apt install fish zsh
# Life quality
sudo apt install bat

# Snap
sudo apt install snapd

# Vim Plug
curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug

# NVM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
nvm install node # "node" is an alias for the latest version

# nvim LSP (For neovim cool automplete situations)

npm install -g vscode-langservers-extracted
npm install -g typescript typescript-language-server
npm install -g dockerfile-language-server-nodejs
npm install -g vim-language-server
npm install -g pyright
npm install -g stylelint-lsp
npm install -g bash-language-server

#RVM
sudo apt-add-repository -y ppa:rael-gc/rvm
sudo apt-get update
sudo apt-get install rvm
sudo usermod -a -G rvm $USER
