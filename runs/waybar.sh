#!/usr/bin/env bash

install_waybar() {
  local runtime_dependencies=(
    "grim"   # screenshot
    "slurp"  # screenshot
    "satty"  # screenshot
    "fuzzel" # power menu
  )

  local dependencies=(
    "git"
    "base-devel"
    "gtkmm3"
    "jsoncpp"
    "libsigc++"
    "fmt"
    "wayland"
    "chrono-date"
    "spdlog"
    "libxkbcommon"
    "upower"
    "gtk3"
    "libpulse"
    "libnl"
    "libappindicator-gtk3"
    "libdbusmenu-gtk3"
    "libmpdclient"
    "sndio"
    "libevdev"
    "cmake"
    "meson"
    "scdoc"
    "wayland-protocols"
    "glib2-devel"
    "gobject-introspection"
    "libgirepository"
  )

  local all_dependencies=("${runtime_dependencies[@]}" "${dependencies[@]}")

  sudo pacman -S --noconfirm --needed "${all_dependencies[@]}"

  local downloads_folder="$HOME/Downloads"
  git clone https://github.com/Alexays/Waybar "$downloads_folder/waybar"
  pushd "$downloads_folder/waybar" || exit
  meson setup build -Drfkill=enabled -Dcava=disabled
  ninja -C build
  sudo ninja -C build install
  popd || exit
}

install_waybar

ln -s "$script_dir/dotfiles/waybar" "$config/waybar"
