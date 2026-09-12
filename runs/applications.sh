#!/usr/bin/env bash

install_apps() {
  local application_list=(
    "firefox"
    "pipewire-jack" # firefox
    "grim"          # screenshot
    "slurp"         # screenshot
    "satty"         # screenshot
    "spotify-launcher"
    "btop"
    "rocm-smi-lib" # btop amd gpu
    "powertop"
    "tlp"
    "mako"
    "nautilus"
    "fuzzel"
    "gimp"
    "libreoffice-still"
    "discord"
  )

  sudo pacman -S --noconfirm --needed "${application_list[@]}"
}

install_apps

ln -s "$script_dir/dotfiles/fuzzel" "$config/fuzzel"
ln -s "$script_dir/dotfiles/mako" "$config/mako"
# ln -s "$script_dir/dotfiles/wlogout" "$config/wlogout"
