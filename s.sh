#!/bin/bash

# Check if the script is running from /usr/local/bin and named 's'
if [[ $(basename "$0") != "s" ]] || [[ $(dirname "$0") != "/usr/local/bin" ]]; then
    echo "Installing S to /usr/local/bin, sudo password required"
    sudo cp "$0" /usr/local/bin/s
    sudo chmod +x /usr/local/bin/s
    echo "SSH Quick Menu Installed. Type 's' to launch the command and add hosts to your ~/.ssh/config file as needed"
    
    # Remove the script if it's not running from /usr/local/bin/s
    if [[ $0 != "/usr/local/bin/s" ]]; then
        rm -- "$0"
    fi

    exit 0
fi

# Check if the operating system is macOS
if [[ "$OSTYPE" != "darwin"* ]]; then
    echo "This script is intended for use on macOS only."
    exit 1
fi

# Check if Homebrew is installed
if ! command -v brew &> /dev/null; then
    echo "Homebrew is not installed. Please install Homebrew."
    exit 1
fi

# Check if fzf is installed, install if not
if ! command -v fzf &> /dev/null; then
    echo "fzf is not installed. Installing fzf..."
    brew install fzf
fi

# Function to parse the SSH config file and extract hosts
parse_ssh_config() {
    awk '$1 == "Host" {print $2}' ~/.ssh/config
}

# Main function to select and connect to a host
ssh_connect() {
    local host
    host=$(parse_ssh_config | fzf --height 40% --reverse)

    if [ -n "$host" ]; then
        echo "Connecting to $host..."
        ssh "$host"
    else
        echo "No host selected."
    fi
}

ssh_connect
