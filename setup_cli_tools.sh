#!/bin/bash

# Define the base directory
BASE_DIR="/Users/chanceneihouse/work/cli-tools"

# Create the directory structure
mkdir -p "$BASE_DIR/firmware"
mkdir -p "$BASE_DIR/bluetooth"
mkdir -p "$BASE_DIR/network"

# Create the files
touch "$BASE_DIR/README.md"
touch "$BASE_DIR/LICENSE"
touch "$BASE_DIR/setup.sh"
touch "$BASE_DIR/firmware/update_firmware.sh"
touch "$BASE_DIR/firmware/README.md"
touch "$BASE_DIR/bluetooth/device_prioritization.sh"
touch "$BASE_DIR/bluetooth/manage_bluetooth.sh"
touch "$BASE_DIR/bluetooth/README.md"
touch "$BASE_DIR/network/manage_network.sh"
touch "$BASE_DIR/network/README.md"

# Print the directory structure to verify
echo "Directory structure and files created under $BASE_DIR:"
tree "$BASE_DIR"
