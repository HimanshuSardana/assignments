#!/bin/bash

# Ensure the script exits on error
set -e

# Add Docker's official GPG key
sudo apt-get update
sudo apt-get install -y ca-certificates curl gnupg
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
$(. /etc/os-release && echo "$VERSION_CODENAME") stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Install Docker and related tools
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin make

# Add user to the docker group
sudo usermod -aG docker "$USER"



# Setup amazon-ecr-credential-helper
git clone https://github.com/awslabs/amazon-ecr-credential-helper.git
cd amazon-ecr-credential-helper/
sudo make docker
sudo cp ./bin/local/docker-credential-ecr-login /usr/bin/docker-credential-ecr-login
sudo chmod +x /usr/bin/docker-credential-ecr-login

# Configure Docker to use the credential helper
DOCKER_CONFIG_FILE=~/.docker/config.json
mkdir -p ~/.docker

if [[ -f "$DOCKER_CONFIG_FILE" ]]; then
    # If the file exists, check if "credsStore" is already set
    if grep -q '"credsStore":' "$DOCKER_CONFIG_FILE"; then
        # Update the credsStore value if it exists
        sed -i 's/"credsStore": *"[^"]*"/"credsStore": "ecr-login"/' "$DOCKER_CONFIG_FILE"
    else
        # Insert the credsStore entry into the existing config
        jq '. + {credsStore: "ecr-login"}' "$DOCKER_CONFIG_FILE" > "$DOCKER_CONFIG_FILE.tmp" && mv "$DOCKER_CONFIG_FILE.tmp" "$DOCKER_CONFIG_FILE"
    fi
else
    # Create the config.json file and add the credsStore entry
    echo '{
    "credsStore": "ecr-login"
}' > "$DOCKER_CONFIG_FILE"
fi

cd ..
echo "Setup of Docker, Docker Compose & Docker Credential Helper completed successfully!"
newgrp docker

