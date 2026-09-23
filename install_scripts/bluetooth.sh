#!/usr/bin/env bash

install_bluetooth() {
  local bluetooth_packages=(
    "bluez"
    "bluez-tools"
    "bluez-utils"
    "bluez-deprecated-tools"
    "bluetui"
  )

  sudo pacman -S --noconfirm --needed "${bluetooth_packages[@]}"
}

install_bluetooth

sudo systemctl enable bluetooth.service
sudo systemctl start bluetooth.service
