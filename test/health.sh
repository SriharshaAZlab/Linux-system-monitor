#!/bin/bash

LOG_DIR="$(dirname "$0")/../logs"
LOG_FILE="$LOG_DIR/system_health.log"

mkdir -p "$LOG_DIR"

{
echo "=================================================="
echo "        Linux System Health Report"
echo "=================================================="
echo "Generated On : $(date)"
echo

echo "Hostname:"
hostname
echo

echo "Operating System:"
cat /etc/os-release | grep PRETTY_NAME
echo

echo "Kernel Version:"
uname -r
echo

echo "System Uptime:"
uptime -p
echo

echo "CPU Usage:"
top -bn1 | grep "Cpu(s)"
echo

echo "Memory Usage:"
free -h
echo

echo "Disk Usage:"
df -h
echo

echo "IP Address:"
hostname -I
echo

echo "=================================================="
echo
} >> "$LOG_FILE"

echo "System health report saved to: $LOG_FILE"
