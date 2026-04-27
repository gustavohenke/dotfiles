#!/bin/sh
set -eu

# Determines if the current profile is a work-devbox profile
is_devbox_profile() {
  [ -n "${DOTFILES_PROFILE:-}" ] && [ "$DOTFILES_PROFILE" = "work-devbox" ]
}

install_op() {
  # If DOTFILES_PROFILE is set to work-devbox, don't install 1Password CLI (it mustn't be used)
  if is_devbox_profile; then
    echo "Skipping 1Password CLI installation for work-devbox profile"
    return
  fi

  if ! command -v op > /dev/null; then
    echo "Installing 1Password CLI..."
    brew install 1password-cli
  fi
}

install_deps() {
  # If DOTFILES_PROFILE is set to work-devbox, don't install any deps (it's a preset with most of what's needed already)
  if is_devbox_profile; then
    echo "Skipping dependency installation for work-devbox profile"
    return
  fi

  if ! command -v brew > /dev/null; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    # Only temporarily add homebrew here; it'll be added to the shell environment permanently in the .zshenv file later
    eval "$(get_brew_path) shellenv"
  fi
}

get_brew_path() {
  case "$(uname -s)" in
    Darwin)
      echo "/opt/homebrew/bin/brew"
      ;;
    Linux)
      echo "/home/linuxbrew/.linuxbrew/bin/brew"
      ;;
    *)
      echo "Unsupported operating system"
      exit 1
  esac
}

echo
echo
echo "::: Running read-source-state.pre hook"
install_deps
install_op
