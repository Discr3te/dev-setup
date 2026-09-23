#!/usr/bin/env bash

sudo pacman -S --noconfirm --needed tmux

# shellcheck disable=2154
ln -s "$script_dir/dotfiles/tmux" "$config_dir/tmux"
