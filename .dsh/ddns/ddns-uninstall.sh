#!/bin/bash

# Check if script is run as root
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi

# Stop and disable the ddclient service
systemctl stop ddclient
systemctl disable ddclient

# Remove the ddclient package
apt purge -y ddclient

# Remove the ddclient configuration files
rm -f /etc/ddclient.conf

echo "ddclient uninstalled and configuration files removed"
