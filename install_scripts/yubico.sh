#!/usr/bin/env bash

# shellcheck disable=2154
source "$script_dir/install_scripts/utils.sh"

install_yubico() {
  local package_list=(
    "pam-u2f"
    "libfido2"
    "yubikey-manager"
    "yubikey-full-disk-encryption"
  )

  # shellcheck disable=2034
  local aur_package_list=("yubico-authenticator")

  install_aur_packages aur_package_list

  sudo pacman -S --noconfirm --needed "${package_list[@]}"
}

install_yubico
