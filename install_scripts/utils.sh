#!/usr/bin/env bash

install_aur_packages() {
  local -n aur_package_list_ref="$1"
  local package aur_packages

  local yay_opts=(
    -S
    --noconfirm
    --answerclean None
    --answerupgrade None
    --answerdiff None # Unsafe to set it to None. Change later
    --answeredit None # Unsafe to set it to None. Change later
  )

  if ! command yay --version &>/dev/null; then
    # shellcheck disable=2154
    bash "$script_dir/install_scripts/aur_helper.sh"
  fi

  for package in "${aur_package_list_ref[@]}"; do
    if ! yay -Q "$package" &>/dev/null; then
      aur_packages+=("$package")
    fi
  done

  yay "${yay_opts[@]}" "${aur_packages[@]}"
}
