#!/bin/sh
set -eu

install_op() {
  if ! command -v op > /dev/null; then
    echo "Installing 1Password CLI..."
    brew install 1password-cli
  fi
}

install_deps() {
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
