#!/usr/bin/env bash
set -e

echo "=== Removing Netdata ==="

sudo systemctl stop netdata || true
sudo systemctl disable netdata || true

sudo apt purge netdata netdata-* -y
sudo apt autoremove -y

sudo rm -rf /etc/netdata /var/lib/netdata /var/cache/netdata /var/log/netdata

echo "Netdata has been completely removed."