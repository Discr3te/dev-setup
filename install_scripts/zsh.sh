#!/usr/bin/env bash

remove_bash_config_files() {
  local bash_config_files=(
    ".bashrc"
    ".bash_profile"
    ".bash_login"
    ".profile"
    ".bash_logout"
    ".bash_history"
  )

  local files
  for files in "${bash_config_files[@]}"; do
    [ -f "$HOME/$files" ] && rm "$HOME/$files"
  done
}

sudo pacman -S --noconfirm --needed zsh
hash -r
sudo chsh -s "$(which zsh)" "$USER"

sudo tee -a /etc/zsh/zshenv >/dev/null <<'EOF'
if [[ -z $XDG_CONFIG_HOME ]]; then
    export XDG_CONFIG_HOME="$HOME/.config"
fi

if [[ -d "$XDG_CONFIG_HOME/zsh" ]]; then
    export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
fi
EOF

ln -s "$script_dir/dotfiles/zsh" "$config_dir/zsh"
