#!/usr/bin/env bash

set -e

DOTFILES="$HOME/.dotfiles"

# https://volta.sh/
install_volta() {
  curl https://get.volta.sh | bash
}

# https://rustup.rs/
install_rustup() {
  curl https://sh.rustup.rs -sSf | sh
}

# https://z-shell.pages.dev/
install_zi() {
  /bin/bash -c "$(curl -fsSL https://git.io/get-zi)" --
}

# https://brew.sh/
install_homebrew() {
  if [ "$(uname)" == "Darwin" ]; then
    brew="/opt/homebrew/bin/brew"
    if [ -z "$brew" ]; then
      echo "Homebrew is not installed, installing now"
      echo "This may take a while"
      echo "Homebrew requires osx command lines tools, please download xcode first"
      /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
    else
      echo "Homebrew is installed, nothing to do here"
    fi
  fi
}

clone_dotfiles() {
  echo "dotfiles -------------------------------------------------"
  
  if [ -f "$DOTFILES" ]; then
    echo "Dotfiles have already been cloned into the home dir"
  else
    echo "Cloning dotfiles"
    git clone https://github.com/twokul/dotfiles.git ~/.dotfiles
  fi
}

# Automatically install Homebrew if it is not installed
install_homebrew || echo "Failed to install Homebrew" && exit 1

# Automatically install Volta if it is not installed
install_volta || echo "Failed to install Volta" && exit 1

# Automatically install rustup if it is not installed
install_rustup || echo "Failed to install rustup" && exit 1

# Automatically install zi if it is not installed
install_zi || echo "Failed to install ZI" && exit 1

# Clone dotfiles repo into `~/.dotfiles/` if needed
clone_dotfiles || echo "Failed to clone dotfiles" && exit 1

# Make sure to cd into `~/.dotfiles`
cd "$DOTFILES"

# Run dotbot
./install

echo "---------------------------------------------------------"
echo "All done!"
echo "🍻"
echo "---------------------------------------------------------"
