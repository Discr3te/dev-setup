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

  local aur_application_list=("orca-slicer")
  local aur_applications=()

  echo "application.sh check for yay"
  sleep 10
  if ! command yay --version &>/dev/null; then
    echo "yay is not installed, installing now..."
    sleep 10
    bash ./aur_helper.sh
  fi
  echo "application.sh, yay installed, installing packages now"
  sleep 10

  for package in "${aur_application_list[@]}"; do
    if ! yay -Q "$package" &>/dev/null; then
      aur_applications+=("$package")
    fi
  done
  local yay_opts=(
    -S
    --noconfirm
    --answerclean None
    --answerupgrade None
    --answerdiff None # Unsafe to set it to None. Change later
    --answeredit None # Unsafe to set it to None. Change later
  )

  yay "${yay_opts[@]}" "${aur_applications[@]}"
  echo "finished installing packages"
  sleep 10

  sudo pacman -S --noconfirm --needed "${application_list[@]}"
}

install_apps

ln -s "$script_dir/dotfiles/fuzzel" "$config_dir/fuzzel"
ln -s "$script_dir/dotfiles/mako" "$config_dir/mako"
# ln -s "$script_dir/dotfiles/wlogout" "$config_dir/wlogout"
