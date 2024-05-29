#!/bin/bash

# Check for macOS software updates, including firmware updates
sudo softwareupdate -ia

# Check for Homebrew updates
if command -v brew &> /dev/null; then
  brew update
  brew upgrade
fi

echo "Firmware updates completed."
