#!/usr/bin/env bash

install_aur_helper_if_missing() {
  if ! command yay --version &>/dev/null; then
    # shellcheck disable=2154
    bash "$script_dir/install_scripts/aur_helper.sh"
  fi
}

install_aur_packages() {
  local package aur_packages
  local -n aur_package_list_ref

  local yay_opts=(
    -S
    --noconfirm
    --answerclean None
    --answerupgrade None
    --answerdiff None # Unsafe to set it to None. Change later
    --answeredit None # Unsafe to set it to None. Change later
  )

  install_aur_helper_if_missing

  for package in "${aur_package_list_ref[@]}"; do
    if ! yay -Q "$package" &>/dev/null; then
      aur_packages_ref+=("$package")
    fi
  done

  yay "${yay_opts[@]}" "${aur_packages[@]}"
}
