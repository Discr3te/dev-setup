#!/usr/bin/env bash

install_apps() {
  local application_list=(
    "firefox"
    "pipewire-jack" # firefox dependency
    "grim"          # screenshot
    "slurp"         # screenshot
    "satty"         # screenshot
    "btop"
    "powertop"
    "rocm-smi-lib"      # btop amd gpu
    "tlp"               # laptop battery saveings
    "mako"              # notification daemon
    "nautilus"          # file manager
    "fuzzel"            # application launcher
    "gimp"              # drawing tool
    "libreoffice-still" # office suite
    "freecad"           # cad software
    "discord"
    "spotify-launcher"
  )

  sudo pacman -S --noconfirm --needed "${application_list[@]}"
}

install_apps

ln -s "$script_dir/dotfiles/fuzzel" "$config_dir/fuzzel"
ln -s "$script_dir/dotfiles/mako" "$config_dir/mako"
# ln -s "$script_dir/dotfiles/wlogout" "$config_dir/wlogout"
