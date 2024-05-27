#!/bin/bash

# Check if script is run as root
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi
echo "Installing Dynu.com DDNS Service ..."
# Prompt for Dynu.com credentials and domain
read -p "Enter your Dynu.com username: " username
read -sp "Enter your Dynu.com password: " password
echo # for newline after password input
read -p "Enter your domain name registered with Dynu.com: " domain
echo
# Install required packages
apt update
apt install -y ddclient

# Create configuration file
cat <<EOF >/etc/ddclient.conf
daemon=3600
protocol=dyndns2
ssl=yes
use=web, web=myip.dynu.com
server=api.dynu.com
login=$username
password=$password
$domain
EOF

# Restart ddclient service
echo
systemctl restart ddclient
systemctl enable ddclient
echo "Dynu.com Dynamic DNS setup complete for domain: $domain"
