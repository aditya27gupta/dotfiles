#!/bin/bash

echo "Installing Applications"
sudo pacman -S zsh ghostty zed uv starship firefox neovim git

echo "Creating Directory"
cd $HOME
mkdir Github
mkdir zsh_plugin

echo "Pulling Repositories for zsh"
cd zsh_plugin
git clone https://github.com/zsh-users/zsh-autosuggestions.git
git clone https://github.com/zsh-users/zsh-completions.git

echo "Pulling Dotfiles"
cd ~/Github/
git clone https://github.com/aditya27gupta/dotfiles.git

echo "Placing all the dotfiles"
cd dotfiles
python3 config_placer.py

