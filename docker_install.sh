#!/bin/bash

# How to Run the Install docker in one command Script:
# 1. Save the Script on the server in a file named docker_install.sh    
# 2. Make the Script Executable using: chmod +x docker_install.sh
# 3. Run the Script using: ./docker_install.sh

# Update Package Index
sudo apt update -y

# Install Required Packages
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common

# Download and Add Docker GPG Key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# Add Docker Repository
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Update Package Index
sudo apt update -y

# Install Docker CE
sudo apt install -y docker-ce

# Start Docker Daemon
sudo systemctl start docker

# Enable Docker to Start on Boot
sudo systemctl enable docker


     
