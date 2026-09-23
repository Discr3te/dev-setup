#!/usr/bin/env bash

install_alacritty() {
  local dependencies=(
    "ttf-jetbrains-mono-nerd"
  )
  sudo pacman -S --noconfirm --needed alacritty "${dependencies[@]}"
}

install_alacritty

# shellcheck disable=2154
ln -s "$script_dir/dotfiles/alacritty" "$config_dir/alacritty"
