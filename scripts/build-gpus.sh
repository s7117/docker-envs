#!/bin/bash

# Create docker build environment
echo "### LOG --> INIT build environment..."
docker buildx create --name ubuntu_envs --use
echo "### LOG --> Created build environment..."

# CUDA
echo "### LOG --> BUILDING CUDA IMAGES..."
docker buildx build -f ./cuda/11.7/Dockerfile --no-cache \
                        --platform=linux/amd64 --push cuda \
                        --tag s7117/ubuntu-cuda:11.7
docker buildx build -f ./cuda/11.8/Dockerfile --no-cache \
                        --platform=linux/amd64 --push cuda \
                        --tag s7117/ubuntu-cuda:11.8
docker buildx build -f ./cuda/12.2/Dockerfile --no-cache \
                        --platform=linux/amd64 --push cuda \
                        --tag s7117/ubuntu-cuda:12.2
echo "### LOG --> CUDA images built..."
echo "### LOG --> Pushing images..."
docker push s7117/ubuntu-cuda:11.7
docker push s7117/ubuntu-cuda:11.8
docker push s7117/ubuntu-cuda:12.2


# ML
echo "### LOG --> BUILDING ML IMAGES..."
docker buildx build -f ./ml/11.7/Dockerfile --no-cache \
                        --platform=linux/amd64 --push ml \
                        --tag s7117/ubuntu-ml:11.7
docker buildx build -f ./ml/11.8/Dockerfile --no-cache \
                        --platform=linux/amd64 --push ml \
                        --tag s7117/ubuntu-ml:11.8
docker buildx build -f ./ml/12.2/Dockerfile --no-cache \
                        --platform=linux/amd64 --push ml \
                        --tag s7117/ubuntu-ml:12.2
echo "### LOG --> ML images built..."
echo "### LOG --> Pushing images..."
docker push s7117/ubuntu-ml:11.7
docker push s7117/ubuntu-ml:11.8
docker push s7117/ubuntu-ml:12.2
