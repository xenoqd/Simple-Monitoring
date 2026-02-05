#!/usr/bin/env bash
set -e

echo "=== Testing dashboard and alerts ==="

if ! command -v stress >/dev/null 2>&1; then
  sudo apt install stress -y
fi

echo "Generating CPU load for 90–120 seconds..."
stress --cpu 4 --timeout 120

echo ""
echo "Load test completed!"
echo "Check the dashboard: http://localhost:19999"
echo "You should see a CPU spike and (if configured) an alert