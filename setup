#!/usr/bin/env bash

sudo pacman -Syu --noconfirm --needed git

projects_dir="$HOME/Projects"
mkdir -p "$projects_dir"

git clone --recurse-submodules https://github.com/Discr3te/dev-setup.git "$projects_dir/dev-setup"

pushd "$projects_dir/dev-setup" || exit
./run
popd || exit
