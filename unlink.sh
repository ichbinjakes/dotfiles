#! /bin/bash

# Remove dotfile symlinks 
stow \
  -D bash \
  -D helix \
  -D starship \
  -D bat \
  -D git
