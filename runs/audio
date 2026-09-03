#!/usr/bin/env bash

install_audio() {
  local audio_packages=(
    "pipewire"
    "wireplumber"
    "pipewire-alsa"
    "pipewire-pulse"
  )

  sudo pacman -S --noconfirm --needed "${audio_packages[@]}"
}

install_audio
