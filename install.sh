# APT
sudo apt update
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
