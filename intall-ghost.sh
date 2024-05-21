#!/bin/bash

# Script: install-ghost.sh
# Description: This script installs a set of files into the user's home directory,
#              makes them executable, and creates an "Options" menu in /usr/local/bin.
#              The Options menu allows less advanced users to easily navigate around the system.
#              It then removes the original source files and directories for better storage management.
# Author: Mat3ush-(Ghost)

# Check if the source directory exists
if [ ! -d ".dsh" ]; then
  echo "Error: Source directory '.dsh' does not exist."
  exit 1
fi

# Define the target directory
TARGET_DIR="$HOME/.dsh"

# Create the target directory if it does not exist
if [ ! -d "$TARGET_DIR" ]; then
  if ! mkdir -p "$TARGET_DIR"; then
    echo "Error: Failed to create the target directory."
    exit 1
  fi
fi

# Copy the contents of the .dsh directory to the target location
if ! cp -r .dsh/* "$TARGET_DIR"; then
  echo "Error: Failed to copy the contents of '.dsh' directory to the target location."
  exit 1
fi

# Make all script files in the target directory and its subdirectories executable
if ! find "$TARGET_DIR" -type f -name "*.sh" -exec chmod +x {} \; ; then
  echo "Warning: Failed to make script files executable."
fi

# Copy the options file to the current location and /usr/local/bin
if ! chmod +x options; then
  echo "Error: Failed to make the 'options' file executable."
  exit 1
fi

if ! sudo cp options /usr/local/bin; then
  echo "Error: Failed to copy the 'options' file to /usr/local/bin."
  exit 1
fi

echo "Options menu has been copied to the current location and /usr/local/bin and made executable."

# Append the content of .profile to ~/.profile
if ! cat .profile >> ~/.profile; then
  echo "Warning: Failed to append the content of .profile to ~/.profile."
fi

echo "Content of .profile has been appended to ~/.profile."

# Clean up source files and folder
if ! rm -rf .dsh options; then
  echo "Warning: Failed to remove the source folder or options file."
fi

echo "Source folder has been removed."

echo "Installation completed successfully."
