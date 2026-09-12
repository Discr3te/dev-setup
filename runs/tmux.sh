#!/usr/bin/env bash

sudo pacman -S --noconfirm --needed tmux

ln -s "$script_dir/dotfiles/tmux" "$config/tmux"
