#!/bin/bash

# Color definitions
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

# Main menu function
main_menu() {
  clear
  echo -e "${RED}Main Menu${NC}"
  echo -e "${GREEN}1)${NC} Install DDNS Client"
  echo -e "${GREEN}2)${NC} Modify Configuration"
  echo -e "${GREEN}3)${NC} Uninstall DDNS Client"
  echo -n "Choose an option: "
  read -r choice
  case $choice in
    1) /root/.dsh/ddns/ddns-install.sh ;;
    2) /root/.dsh/ddns/ddns-uninstall.sh ;;
    3) /root/.dsh/ddns/ddns-menu.sh ;;
    6) exit 0 ;;
    *) echo "Invalid option" && sleep 1 && main_menu ;;
  esac
}

# Run the main menu
main_menu

