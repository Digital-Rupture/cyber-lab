#!/bin/bash

# WSL Initialization Script for Cybersecurity Lab
# Tested on Ubuntu 22.04 under WSL2

echo "🔧 Starting WSL environment setup..."

# Update and upgrade system
echo "📦 Updating package lists..."
sudo apt update && sudo apt upgrade -y

# Install core utilities
echo "🧰 Installing core tools..."
sudo apt install -y curl wget git vim net-tools htop unzip gnupg lsb-release

# Install Podman
echo "🐳 Installing Podman..."
source /etc/os-release
. /etc/os-release
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable/${ID}_${VERSION_ID}/Release.key | \
    gpg --dearmor -o /etc/apt/keyrings/libcontainers.gpg
echo "deb [signed-by=/etc/apt/keyrings/libcontainers.gpg] https://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable/${ID}_${VERSION_ID}/ /" | \
    sudo tee /etc/apt/sources.list.d/devel:kubic:libcontainers:stable.list
sudo apt update
sudo apt install -y podman

# Enable systemd (optional but useful for some services)
echo "⚙️ Configuring systemd support..."
sudo apt install -y systemd-genie

# Install cybersecurity tools
echo "🛡️ Installing cybersecurity tools..."
sudo apt install -y tcpdump nmap wireshark tshark netcat

# Optional: Install Suricata
echo "🕵️ Installing Suricata..."
sudo add-apt-repository ppa:oisf/suricata-stable -y
sudo apt update
sudo apt install -y suricata

# Optional: Install ELK stack (via container later)
echo "📊 ELK stack will be installed via Podman containers."

echo "✅ WSL setup complete. Please restart your WSL session if needed."

