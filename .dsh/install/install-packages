#!/bin/bash

# Color definitions
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

# Function to install LAMPP stack with Lighttpd
install_lampp() {
  echo "Updating package list..."
  apt update -y

  echo "Installing Lighttpd..."
  apt install lighttpd -y

  echo "Installing MariaDB..."
  apt install mariadb-server mariadb-client -y

  echo "Installing PHP..."
  apt install php php-cgi php-mysql -y
  lighttpd-enable-mod fastcgi
  lighttpd-enable-mod fastcgi-php

  echo "Restarting Lighttpd..."
  service lighttpd restart

  echo "LAMPP Stack with Lighttpd installed successfully!"
  sleep 2
}

# Install packages menu function
install_packages_menu() {
  clear
  echo -e "${RED}Install Packages Menu${NC}"
  echo -e "${GREEN}1)${NC} Install LAMPP Stack with Lighttpd"
  echo -e "${GREEN}2)${NC} Back to Main Menu"
  echo -n "Choose an option: "
  read -r choice
  case $choice in
    1) install_lampp ;;
    2) ./main_menu.sh ;;
    *) echo "Invalid option" && sleep 1 && install_packages_menu ;;
  esac
}

# Run the install packages menu
install_packages_menu
