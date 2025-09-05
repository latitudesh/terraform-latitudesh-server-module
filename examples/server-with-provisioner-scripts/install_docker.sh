#!/bin/bash

# Install Docker
sudo apt-get update -y && sudo apt-get install -y docker.io

# Add the Docker group
sudo groupadd docker

# Start the Docker daemon
sudo systemctl start docker

# Enable the Docker daemon
sudo systemctl enable docker

# Check the status of the Docker daemon
sudo systemctl status docker

# Add the current user to the Docker group
sudo usermod -aG docker $USER

# Restart the Docker daemon
sudo systemctl restart docker

exit 0