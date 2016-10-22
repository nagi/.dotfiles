#!/bin/bash

SRC_DIR=$(cd "$(dirname "$0")"; pwd)
DOTFILES_DIR="$SRC_DIR"/dotfiles
DOTFILES=$(ls -A "$DOTFILES_DIR")

for f in $DOTFILES
do
  ln -s "$DOTFILES_DIR"/$f "$HOME"/$f
done
rm "$HOME"/.dotfiles/dotfiles/.oh-my-zsh/.oh-my-zsh
