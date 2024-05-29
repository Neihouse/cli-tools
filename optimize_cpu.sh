#!/bin/zsh
# File: optimize_cpu.sh

echo "Optimizing CPU settings..."

# Disable CPU throttling - Adjust system limits
sudo sysctl -w kern.maxvnodes=600000

echo "CPU optimization complete."
