#! /bin/bash

# remove existing files
rm -r ${HOME}/.config/zellij
rm -r ${HOME}/.config/starship
rm -r ${HOME}/.config/helix

# create dotfile symlinks - Assumes this directory is ~/dotfiles
stow -S .config -S .bashrc

echo "To remove the dotfile configuration run:"
echo "    stow -D .config"
