#!/bin/bash

# Define the Docker image to deploy
IMAGE_NAME="revathitadela1/devops-build-app:latest"  # Replace with your Docker Hub image tag
CONTAINER_NAME="devops-app"  # The name of the container you want to use

# Pull the latest image from Docker Hub
echo "Pulling latest image from Docker Hub..."
sudo docker pull $IMAGE_NAME

# Stop and remove the existing container (if any)
echo "Stopping and removing existing container..."
sudo docker stop $CONTAINER_NAME
sudo docker rm $CONTAINER_NAME

# Run the new container
echo "Starting new container..."
sudo docker run -d --name $CONTAINER_NAME -p 80:80 $IMAGE_NAME

echo "Deployment completed successfully."

