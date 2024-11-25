#!/bin/bash

# Define repository name (adjust as needed)
IMAGE_NAME="devops-build-app"
DOCKER_HUB_USER="revathitadela1"  # Replace with your Docker Hub username
DOCKER_HUB_REPO="rev"         # Replace with your Docker Hub repository

# Pull latest changes from GitHub
echo "Pulling latest changes from GitHub..."
git pull origin dev

# Build the Docker image
echo "Building Docker image..."
sudo docker build -t $DOCKER_HUB_USER/$DOCKER_HUB_REPO .

# Tag the image with 'latest' and 'dev' tags
echo "Tagging image..."
sudo docker tag $DOCKER_HUB_USER/$DOCKER_HUB_REPO $DOCKER_HUB_USER/$DOCKER_HUB_REPO:latest
sudo docker tag $DOCKER_HUB_USER/$DOCKER_HUB_REPO $DOCKER_HUB_USER/$DOCKER_HUB_REPO:dev

# Push the image to Docker Hub
echo "Pushing Docker image to Docker Hub..."
sudo docker push $DOCKER_HUB_USER/$DOCKER_HUB_REPO:latest
sudo docker push $DOCKER_HUB_USER/$DOCKER_HUB_REPO:dev

echo "Build and push completed successfully."

