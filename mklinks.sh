#! /bin/bash

# remove existing files
rm -r ${HOME}/.config/zellij
rm -r ${HOME}/.config/starship
rm -r ${HOME}/.config/helix

# create dotfile symlinks
stow --target=${HOME}/.config .config

echo "To remove the dotfile configuration run:"
echo "    stow -D --target=$HOME/.config .config"
