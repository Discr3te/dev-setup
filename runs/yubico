#!/usr/bin/env bash

install_yubico() {
  local dependencies=(
    "pam-u2f"
    "libfido2"
    "yubikey-manager"
    "yubikey-full-disk-encryption"
  )
  local aur_dependencies_list=("yubico-authenticator")
  local aur_dependencies=()
  if ! command yay --version &>/dev/null; then
    echo "yay is not installed, AUR packages will no be installed"
  else
    for package in "${aur_dependencies_list[@]}"; do
      if ! yay -Q "$package" &>/dev/null; then
        aur_dependencies+=("$package")
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

    yay "${yay_opts[@]}" "${aur_dependencies[@]}"
  fi

  sudo pacman -S --noconfirm --needed "${dependencies[@]}"
}

install_yubico
