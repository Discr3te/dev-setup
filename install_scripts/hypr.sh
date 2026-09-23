#!/usr/bin/env bash

install_hypr_ecosystem() {
  local hypr_package_list=(
    "hyprland"
    "hypridle"
    "hyprlock"
    "hyprpaper"
  )
  local dependencies=(
    "wayland"
    "wayland-protocols"
    "xorg-xwayland"
  )

  local combined_packages=("${hypr_package_list[@]}" "${dependencies[@]}")

  sudo pacman -S --noconfirm --needed "${combined_packages[@]}"
}

install_hypr_ecosystem

# shellcheck disable=2154
ln -s "$script_dir/dotfiles/hypr" "$config_dir/hypr"
