#!/usr/bin/env bash

install_neovim() {
  local dependencies=(
    "tree-sitter-cli"
    "wl-clipboard"
    "unzip"
    "wget"
    "curl"
    "gzip"
    "tar"
    "bash"
    "git"
  )

  sudo pacman -S --noconfirm --needed neovim "${dependencies[@]}"
}

install_neovim

# shellcheck disable=2154
ln -s "$script_dir/dotfiles/nvim" "$config_dir/nvim"
