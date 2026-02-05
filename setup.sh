#!/usr/bin/env bash
set -e

echo "=== Installing Netdata ==="

sudo apt update -y

sudo apt install netdata -y

sudo systemctl enable --now netdata

echo ""
echo "Netdata installed and running!"
echo "Dashboard available at: http://localhost:19999"
echo "Server IP: $(hostname -I | awk '{print $1}'):19999"
echo "Check status: sudo systemctl status netdata"
