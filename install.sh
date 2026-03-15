#!/bin/sh
set -eu

sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply gustavohenke
