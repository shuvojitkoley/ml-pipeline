#!/bin/bash
set -e

echo "=== Starting Deployment on AWS EC2 ==="

PROJECT_DIR="/home/ubuntu/ml-deployment-project"

cd "$PROJECT_DIR"

echo "Pulling latest code from repository..."
git pull origin main

echo "Building and restarting Docker containers..."
docker-compose down
docker-compose up --build -d

echo "Cleaning up dangling Docker images..."
docker image prune -f

echo "=== Deployment Completed Successfully ==="