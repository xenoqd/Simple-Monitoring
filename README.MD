# Basic System Monitoring with Netdata

A beginner project to learn the fundamentals of system monitoring

This project based on <https://roadmap.sh/projects/simple-monitoring-dashboard> challenge

## Features

- Install Netdata on Linux
- Monitor essential metrics (CPU, RAM, Disk I/O)
- Access a beautiful real-time web dashboard
- Create a custom alert (e.g., CPU usage > 80%)
- Automate setup, testing, and cleanup with shell scripts

## Requirements

- Linux system (Ubuntu recommended)
- Root / sudo access
- Internet connection

### 1. Install Netdata

```bash
sudo apt install netdata -y
```

### 2.  Verify it's working correctly

```bash
sudo systemctl status netdata
```

it should be active(running)

### 3. Open the dashboard in browser

<http://<your_server_IP:19999>

in dashboard you could see CPU, disk usage and more

### 4. Set up a custom alert (CPU > 80%)

```bash
sudo nano /etc/netdata/health.d/custom-cpu.conf
```

add:

```bash
alarm: high_cpu_usage
on: system.cpu
lookup: average -30s unaligned of user,system
every: 15s
warn: $this > 80
crit: $this > 95
info: High CPU load (user + system) more than 80%
to: sysadmin
```

reload netdata

```bash
sudo netdatacli reload-health
```

### 5. Test your custom alert

```bash
sudo apt install stress -y
stress --cpu 4 --timeout 120
```

## Scripts

The project includes three scripts:

setup.sh — installs Netdata

test_dashboard.sh — generates CPU load test

cleanup.sh — completely removes Netdata from your Linux system
