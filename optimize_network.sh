#!/bin/zsh
# File: optimize_network.sh

echo "Optimizing network settings..."

# Increase TCP buffer sizes
sudo sysctl -w net.inet.tcp.recvspace=65536
sudo sysctl -w net.inet.tcp.sendspace=65536

# Reduce TCP delays
sudo sysctl -w net.inet.tcp.delayed_ack=0

echo "Network optimization complete."
