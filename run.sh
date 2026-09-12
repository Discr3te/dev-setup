#!/usr/bin/env bash

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"
config_dir="$HOME/.config"

export script_dir config_dir

mkdir -p "$config_dir" "$HOME/.local"

. "$script_dir/local/bin/update_mirrors"

for script in "$script_dir/runs"/*; do
  [ -f "$script" ] && [ -x "$script" ] && bash "$script"
done

ln -s "$script_dir/dotfiles/wallpapers" "$config_dir/wallpapers"
ln -s "$script_dir/local/bin" "$HOME/.local/bin"

reboot
