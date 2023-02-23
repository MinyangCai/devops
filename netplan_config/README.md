# Network configuration for Jetson

## Current Model
- netplan + systemd-networkd backend for static IP network interfaces
- NetworkManager for others (Eventually move to networkd bc we probably don't need a GUI)

network_config.yaml has the static network configuration for a Cybersight that works on the Wisetech Cell

## Dependencies
- netplan.io

## Install

```sh
sudo apt update
sudo apt install netplan.io
```

## Usage
Modify the static IP or interface name in network_config.yaml if necessary.
```sh
# Copy the yaml file over
sudo cp <DEVOPS_PROJECT_DIR>/netplan_config/network_config.yaml /etc/netplan/
# Apply network configuration
sudo netplan apply

# Check if the IP address reflects
ip a
```
