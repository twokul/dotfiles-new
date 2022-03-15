#!/usr/bin/env bash

set -e

DOTFILES="$HOME/.dotfiles"

# https://volta.sh/
install_volta() {
  volta="~/.volta"
  if [ -z "$volta" ]; then
    echo "Volta is not installed, installing now"
    curl https://get.volta.sh | bash
  else
    echo "Volta is already installed, nothing to do here"
  fi
}

# https://rustup.rs/
install_rustup() {
  rustup="~/.rustup"
  if [ -z "$rustup" ]; then
    echo "Rustup is not installed, installing now"
    curl https://sh.rustup.rs -sSf | bash
  else
    echo "Rustup is already installed, nothing to do here"
  fi
}

# https://z-shell.pages.dev/
install_zi() {
  zi="~/.zi"
  if [ -z "$zi" ]; then
    echo "ZI is not installed, installing now"
    /bin/bash -c "$(curl -fsSL https://git.io/get-zi)" --
  else
    echo "ZI is already installed, nothing to do here"
  fi
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
      echo "Homebrew is already installed, nothing to do here"
    fi
  fi
}

clone_dotfiles() {
  echo "dotfiles -------------------------------------------------"
  
  if [ ! -d "$DOTFILES" ]; then
    echo "Cloning dotfiles"
    git clone https://github.com/twokul/dotfiles.git ~/.dotfiles
  else
    echo ".dotfiles have already been cloned into the home dir"
  fi
}

# Homebrew needs `sudo` access when running the fresh install
echo "Starting install script, please grant me sudo access..."
sudo -v

# Keep-alive: update existing sudo time stamp if set, otherwise do nothing.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Automatically install Homebrew if it is not installed
install_homebrew || echo "Failed to install Homebrew"

# Automatically install Volta if it is not installed
install_volta || echo "Failed to install Volta"

# Automatically install rustup if it is not installed
install_rustup || echo "Failed to install rustup"

# Automatically install zi if it is not installed
install_zi || echo "Failed to install ZI"

# Clone dotfiles repo into `~/.dotfiles/` if needed
clone_dotfiles || echo "Failed to clone dotfiles"

# Make sure to cd into `~/.dotfiles`
cd "$DOTFILES"

# Run dotbot
$DOTFILES/install

echo "---------------------------------------------------------"
echo "All done!"
echo "🍻"
echo "---------------------------------------------------------"
