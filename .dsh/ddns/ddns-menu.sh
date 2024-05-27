#!/bin/bash

# Color definitions
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

# Main menu function
main_menu() {
  clear
  echo -e "${RED}Main Menu${NC}"
  echo
  echo -e "${GREEN}1)${NC} Install DDNS Client"
  echo -e "${GREEN}2)${NC} Modify Configuration"
  echo -e "${GREEN}3)${NC} Uninstall DDNS Client"
  echo -e "${GREEN}4)${NC} Exit"
  echo
  echo -n "Choose an option: "
  read -r choice
  case $choice in
    1) /root/.dsh/ddns/ddns-install.sh ;;
    2) /root/.dsh/ddns/ddns-configure.sh ;; # Assuming this script modifies the configuration
    3) /root/.dsh/ddns/ddns-uninstall.sh ;;
    4) exit 0 ;;
    *) echo -e "Invalid option. Please choose a valid option." && sleep 1 && main_menu ;;
  esac
}

# Run the main menu
main_menu
