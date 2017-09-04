#!/bin/bash
DOTFILES=$HOME/dotfiles

mkdir -p $HOME/.config/sxhkd
mkdir -p $HOME/.config/bspwm
ln -sf "$DOTFILES/sxhkdrc" "$HOME/.config/sxhkd/sxhkdrc"
ln -sf "$DOTFILES/bspwmrc" "$HOME/.config/bspwm/bspwmrc"
