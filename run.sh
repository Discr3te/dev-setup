#!/usr/bin/env bash

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"
config="$HOME/.config"
export script_dir
export config

. "$script_dir/local/bin/update_mirrors"

for script in "$script_dir/runs"/*; do
  [ -f "$script" ] && [ -x "$script" ] && bash "$script"
done

mkdir -p "$config"
mkdir -p "$HOME/.local"

ln -s "$script_dir/dotfiles/wallpapers" "$config/wallpapers"
ln -s "$script_dir/local/bin" "$HOME/.local/bin"

reboot
