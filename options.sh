#!/bin/bash

# Color definitions
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

# Main menu function
main_menu() {
  while true; do
    clear
    echo -e "${RED}Main Menu${NC}"
    echo -e "${GREEN}1)${NC} Install Packages"
    echo -e "${GREEN}2)${NC} Modify Configuration"
    echo -e "${GREEN}3)${NC} Start/Stop/Restart Services"
    echo -e "${GREEN}4)${NC} Install DDNS Service"
    echo -e "${GREEN}5)${NC} Option 5"
    echo -e "${GREEN}6)${NC} Exit"
    echo -n "Choose an option: "
    read -r choice
    case $choice in
      1) /root/.dsh/install/install-packages.sh ;;
      2) /root/.dsh/conf/modify-configs.sh ;;
      3) /root/.dsh/conf/restart-services.sh ;;
      4) /root/.dsh/ddns/ddns-menu.sh ;;
      5) echo "Option 5 selected. Future functionality can be added here." && sleep 1 ;;
      6) exit 0 ;;
      *) echo "Invalid option" && sleep 1 ;;
    esac
  done
}

# Run the main menu
main_menu
