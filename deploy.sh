#!/bin/bash

# Powered by Tomilola Oluwafemi -> https://linkedin.com/in/tomilola-oluwafemi

# Exit on any error
set -e

# Set the necessary variables
DROPLET_IP="your_droplet_ip"
CONTAINER_NAME="your_container_name"
IMAGE_NAME="your_dockerhub_username/your_image_name"

# Check if there are changes in the git repository
if [ "$(git status --porcelain)" ]; then
    echo "Files have changed, building and pushing Docker image..."
    docker build -t $IMAGE_NAME .
    docker push $IMAGE_NAME
else
    echo "No changes detected, skipping Docker image build and push."
fi

# SSH into the Droplet and update the Docker container
ssh root@$DROPLET_IP << EOF
    set -e

    # Check if the container is running or stopped, then remove it if exists
    if [ \$(docker ps -aq -f name=$CONTAINER_NAME) ]; then
        docker stop $CONTAINER_NAME || true
        docker rm $CONTAINER_NAME || true
    fi

    # Pull the updated Docker image
    docker pull $IMAGE_NAME

    # Run the updated container
    docker run -d --name $CONTAINER_NAME --restart unless-stopped -p 8000:8000 $IMAGE_NAME
EOF


echo "Deployment completed!"
