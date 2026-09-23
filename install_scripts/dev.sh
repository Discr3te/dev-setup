#!/usr/bin/env bash

install_dev() {
  local packages=(
    "base-devel"
    "less"
    "unzip"
    "npm"
    "git"
  )

  sudo pacman -S --noconfirm --needed "${packages[@]}"
}

install_dev

# shellcheck disable=2154
ln -s "$script_dir/dotfiles/git" "$config_dir/git"
