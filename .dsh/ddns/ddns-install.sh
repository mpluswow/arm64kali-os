#!/bin/bash

# Check if the script is run as root
if [[ $EUID -ne 0 ]]; then
    echo "This script must be run as root" 
    exit 1
fi

echo "Installing Dynu.com DDNS Service ..."

# Update package list
echo "Updating package list..."
if apt update; then
    echo "Package list updated successfully."
else
    echo "Failed to update package list."
    exit 1
fi

# Install ddclient
echo "Installing ddclient..."
if apt install -y ddclient; then
    echo "ddclient installed successfully."
else
    echo "Failed to install ddclient."
    exit 1
fi

# Restart ddclient service using systemctl
echo "Restarting ddclient service..."
if systemctl restart ddclient; then
    echo "ddclient service restarted successfully."
else
    echo "Failed to restart ddclient service."
    exit 1
fi

echo "Dynu.com Dynamic DNS setup complete."
