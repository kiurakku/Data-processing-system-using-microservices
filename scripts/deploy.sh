#!/bin/bash

# Збираємо Docker-образи
docker build -t your-dockerhub-username/api-gateway:latest ./api-gateway
docker build -t your-dockerhub-username/data-processor:latest ./data-processor

# Завантажуємо образи до Docker Hub
docker push your-dockerhub-username/api-gateway:latest
docker push your-dockerhub-username/data-processor:latest

# Розгортаємо в Kubernetes за допомогою Terraform
cd terraform
terraform init
terraform apply -auto-approve