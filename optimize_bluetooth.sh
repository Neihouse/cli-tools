#!/bin/zsh
# File: optimize_bluetooth_safe.sh

echo "Optimizing Bluetooth settings safely..."

# Restart Bluetooth service using a safer approach
sudo pkill -HUP -f "Bluetooth"

echo "Bluetooth optimization complete."
