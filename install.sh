#!/usr/bin/bash

echo "*** Installing Updates ***"

#sudo apt update
#sudo apt upgrade -y

echo "*** Installing curl ***"
sudo apt install curl

echo "*** Installing zsh ***"
sudo apt install zsh -y

echo "*** Installing oh-my-zsh ***"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

echo "*** Installing Starship ***"
sh -c "$(curl -fsSL https://starship.rs/install.sh)"

echo "*** Getting dotfiles ***"
git clone https://github.com/ShariqAsadi/dotfiles.git ~/workspace/dotfiles

echo "*** Symlinking configs ***"
ln -fs ~/workspace/dotfiles/.gitconfig ~/.gitconfig
ln -fs ~/workspace/dotfiles/.zshrc ~/.zshrc
ln -fs ~/workspace/dotfiles/starship.toml ~/.config/starship.toml

echo "*** Changing shell to zsh ***"
chsh -s $(which zsh)
