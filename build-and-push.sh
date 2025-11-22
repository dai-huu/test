#!/bin/bash

# Docker Hub username
DOCKER_HUB_USERNAME="daihuu"

# List of microservices
MICROSERVICES=("auth" "client" "expiration" "orders" "payments" "tickets")

# Docker Hub repository prefix
REPO_PREFIX="$DOCKER_HUB_USERNAME"

# Loop through each microservice
for SERVICE in "${MICROSERVICES[@]}"; do
  echo "Building and pushing Docker image for $SERVICE..."

  # Navigate to the microservice directory
  cd $SERVICE || { echo "Directory $SERVICE not found!"; exit 1; }

  # Build the Docker image
  docker build -t $REPO_PREFIX/$SERVICE:latest .

  # Push the Docker image to Docker Hub
  docker push $REPO_PREFIX/$SERVICE:latest

  # Navigate back to the root directory
  cd ..

  echo "Successfully built and pushed $SERVICE to Docker Hub."
done

echo "All microservices have been built and pushed successfully!"
