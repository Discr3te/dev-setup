#!/usr/bin/env bash

install_fonts() {
  local fonts=(
    "ttf-jetbrains-mono-nerd"
    "ttf-nerd-fonts-symbols"
    "otf-font-awesome"
    "noto-fonts-cjk"
    "noto-fonts-emoji"
    "terminus-font"
  )

  sudo pacman -S --noconfirm --needed "${fonts[@]}"
}

install_fonts
