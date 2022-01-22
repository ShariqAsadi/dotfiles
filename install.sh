#!/usr/bin/bash

echo "*** Installing Updates ***"

sudo apt update
sudo apt upgrade -y

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

echo "*** Installing Jetbrains Nerd Font ***"
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/JetBrainsMono.zip
unzip JetBrainsMono.zip -d JetbrainsMono
sudo mkdir -p /usr/share/fonts/truetype/Jetbrains
sudo cp JetbrainsMono/*.ttf /usr/share/fonts/truetype/Jetbrains
fc-cache -f -v
fc-list | grep Jetbrains

echo "*** Installing VSCode ***"
sudo snap install --classic code