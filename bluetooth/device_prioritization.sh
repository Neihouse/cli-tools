#!/bin/bash

# List all connected Bluetooth devices
echo "Connected Bluetooth devices:"
system_profiler SPBluetoothDataType | grep -E "Connected: Yes|Address|Product ID|Vendor ID|Minor Type"

# Disconnect specific Bluetooth devices by their MAC address
disconnect_device() {
  MAC_ADDRESS=$1
  sudo blueutil --disconnect "$MAC_ADDRESS"
}

# Example: Disconnect multiple devices (add actual MAC addresses)
disconnect_device "00:42:79:FC:A7:B6"  # Example: JBL Charge 4
disconnect_device "34:81:F4:F3:08:0F"  # Example: SOUNDBOKS #007474

# Verify disconnection
echo "Updated Bluetooth device list:"
system_profiler SPBluetoothDataType | grep -E "Connected: Yes|Address|Product ID|Vendor ID|Minor Type"
