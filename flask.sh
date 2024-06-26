#!/bin/bash
# Variables
IMAGE_NAME="flaskapp"
PORT_MAPPING="3002:3002"

docker run -d -p $PORT_MAPPING $IMAGE_NAME

if [ $? -eq 0 ]; then
    echo "Docker container for $IMAGE_NAME is running on port $PORT_MAPPING."
else
    echo "Failed to start Docker container for $IMAGE_NAME."
    exit 1
fi