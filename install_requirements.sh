#!/bin/bash

echo "Updating system..."
sudo apt update && sudo apt upgrade -y

echo "Installing Python3 & Pip..."
sudo apt install python3 python3-pip -y

echo "Installing Virtual Environment..."
sudo apt install python3-venv -y

echo "Setting up Flask environment..."
cd flask_app
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
deactivate
cd ..

echo "Installing Terraform..."
sudo apt install -y terraform

echo "Installing Jenkins..."
sudo apt install openjdk-11-jdk -y
wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian binary/" | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt update
sudo apt install jenkins -y
sudo systemctl enable --now jenkins

echo "Installing Prometheus & Node Exporter..."
cd monitoring
docker-compose up -d
cd ..

echo "Installation complete!"
