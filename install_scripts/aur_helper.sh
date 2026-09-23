#!/usr/bin/env bash

install_aur_helper() {
  local dependencies=(
    "git"
    "base-devel"
  )

  if ! command yay --version &>/dev/null; then
    sudo pacman -S --noconfirm --needed "${dependencies[@]}"

    local downloads_folder="$HOME/Downloads"
    mkdir -p "$downloads_folder"
    git clone https://aur.archlinux.org/yay.git "$downloads_folder/yay"
    pushd "$downloads_folder/yay" || exit
    makepkg -si --noconfirm
    popd || exit
  else
    echo "AUR helper (yay) already installed."
  fi
}

install_aur_helper
