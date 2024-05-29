#!/bin/bash

# Define the log file
LOG_FILE="/Users/chanceneihouse/work/cli-tools/performance_log.txt"

# Define the interval (in seconds) between each monitoring cycle
INTERVAL=60

# Initialize log file
echo "Starting continuous monitoring..." > $LOG_FILE
echo "Timestamp, CPU Usage (% user), CPU Usage (% sys), CPU Usage (% idle), Load Average (1m), Load Average (5m), Load Average (15m), Max Vnodes, Recvspace, Sendspace, Delayed Ack, Download Speed (Mbps), Upload Speed (Mbps), Bluetooth Devices Connected" >> $LOG_FILE

# Function to monitor performance
monitor_performance() {
    while true; do
        # Timestamp
        TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")

        # CPU Usage
        CPU_USAGE=$(top -l 1 -n 0 | grep "CPU usage" | awk '{print $3, $5, $7}')

        # Load Average
        LOAD_AVG=$(uptime | awk -F'[a-z]:' '{ print $2 }')

        # Max Vnodes
        MAX_VNODES=$(sysctl kern.maxvnodes | awk '{print $2}')

        # Network Settings
        RECVSPACE=$(sysctl net.inet.tcp.recvspace | awk '{print $2}')
        SENDSPACE=$(sysctl net.inet.tcp.sendspace | awk '{print $2}')
        DELAYED_ACK=$(sysctl net.inet.tcp.delayed_ack | awk '{print $2}')

        # Network Speed Test
        SPEEDTEST=$(speedtest-cli --simple | awk '/Download/{print $2} /Upload/{print $2}')
        DOWNLOAD_SPEED=$(echo $SPEEDTEST | awk '{print $1}')
        UPLOAD_SPEED=$(echo $SPEEDTEST | awk '{print $2}')

        # Bluetooth Devices Connected
        BLUETOOTH_DEVICES=$(system_profiler SPBluetoothDataType | grep "Connected: Yes" | wc -l)

        # Log the collected data
        echo "$TIMESTAMP, $CPU_USAGE, $LOAD_AVG, $MAX_VNODES, $RECVSPACE, $SENDSPACE, $DELAYED_ACK, $DOWNLOAD_SPEED, $UPLOAD_SPEED, $BLUETOOTH_DEVICES" >> $LOG_FILE

        # Wait for the specified interval before next monitoring cycle
        sleep $INTERVAL
    done
}

# Start monitoring
monitor_performance
