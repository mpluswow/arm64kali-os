#!/bin/bash

# Color definitions
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

# Modify Configuration menu function
modify_configs_menu() {
  clear
  echo -e "${RED}Modify Configuration${NC}"
  echo
  echo -e "${GREEN}1)${NC} Modify SSH Config"
  echo -e "${GREEN}2)${NC} Modify Lighttpd Config"
  echo -e "${GREEN}3)${NC} Modify MariaDB Config"
  echo -e "${GREEN}4)${NC} Modify VNCServer Config"
  echo -e "${GREEN}5)${NC} Modify DDNS Client Config"
  echo
  echo -n "Choose an option: "
  read -r choice
  case $choice in
    1) nano /etc/ssh/sshd_config ;;
    2) nano /etc/lighttpd/lighttpd.conf ;;
    3) nano /etc/mysql/mariadb.conf.d/50-server.cnf ;;
    4) nano /etc/vnc.conf ;;
    5) nano /etc/ddclient.conf ;;
    *) echo -e "Invalid option. Please choose a valid option." && sleep 1 && modify_configs_menu ;;
  esac
}

# Run the modify configuration menu
modify_configs_menu
