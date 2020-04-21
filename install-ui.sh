#!/bin/bash
DOTFILES=$HOME/dotfiles

mkdir -p $HOME/.config/sxhkd
mkdir -p $HOME/.config/bspwm
mkdir -p $HOME/.config/polybar

ln -sf "$DOTFILES/sxhkdrc" "$HOME/.config/sxhkd/sxhkdrc"
ln -sf "$DOTFILES/bspwmrc" "$HOME/.config/bspwm/bspwmrc"
ln -sf "$DOTFILES/polybar" "$HOME/.config/polybar/config"
ln -sf "$DOTFILES/xresources" "$HOME/.Xresources"

