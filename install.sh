#!/bin/sh
set -eu

echo
echo
echo "::: Running dotfiles installation"

# Install to current user's local bins only
sh -c "$(curl -fsLS get.chezmoi.io)" -- -b $HOME/.local/bin init --apply gustavohenke
