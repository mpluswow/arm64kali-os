#.profile

# ANSI color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color
echo
echo
# Function to log messages in green
log_message() {
  local message=$1
  echo -e "${GREEN}$message${NC}"
}

# Function to log service names in red
log_service() {
  local service=$1
  echo -e "${RED}$service${NC}"
}

# Function to check if a service is installed
is_service_installed() {
  local service=$1
  if [ -f "/etc/init.d/$service" ]; then
    return 0
  else
    return 1
  fi
}

# Function to restart a service if installed
manage_service() {
  local service=$1
  local service_name=${2:-$service}  # Default to $service if $service_name is not provided
  if is_service_installed "$service"; then
    log_service "Restarting $service_name..."
    sudo service $service stop
    log_message "$service_name stopped."
    sudo service $service start
    log_message "$service_name started."
  else
    log_message "$service_name is not installed, skipping."
  fi
}

# Ensure the script is run with sufficient privileges
if [ "$EUID" -ne 0 ]; then
  log_message "Please run this script as root or with sudo."
  exit 1
fi

# Notify users that the script has started
log_message "Starting service management script."

# Manage the services
manage_service "mariadb" "MariaDB"
manage_service "lighttpd" "Lighttpd"
manage_service "ssh" "SSH"
manage_service "ddclient" "ddclient"

echo
# Notify users that the script has completed
log_message "Service management script completed."
echo
