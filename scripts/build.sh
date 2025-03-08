#!/bin/bash

# Create docker build environment
echo "### LOG --> INIT build environment..."
docker buildx create --name ubuntu_envs --use
echo "### LOG --> Created build environment..."

# Base
docker buildx build -f ./base/20.04/Dockerfile --no-cache \
                        --platform linux/amd64,linux/arm64 --push base \
                        --tag s7117/ubuntu-cuda:20.04
docker buildx build -f ./base/22.04/Dockerfile --no-cache \
                        --platform linux/amd64,linux/arm64 --push base \
                        --tag s7117/ubuntu-cuda:22.04
docker buildx build -f ./base/latest/Dockerfile --no-cache \
                        --platform linux/amd64,linux/arm64 --push base \
                        --tag s7117/ubuntu-cuda:latest
echo "### LOG --> Base images built..."
echo "### LOG --> Pushing images..."
# docker push s7117/ubuntu-base:20.04
# docker push s7117/ubuntu-base:22.04
# docker push s7117/ubuntu-base:latest

# Miniforge3
docker buildx build -f ./conda/Dockerfile --no-cache \
                        --platform linux/amd64,linux/arm64 --push conda \
                        --tag s7117/ubuntu-conda:latest
echo "### LOG --> Conda images built..."
echo "### LOG --> Pushing images..."
# docker push s7117/ubuntu-conda:latest

# Coral TPU
docker buildx build -f ./coraltpu/Dockerfile --no-cache \
                        --platform linux/amd64,linux/arm64 --push coraltpu \
                        --tag s7117/ubuntu-coraltpu:latest
echo "### LOG --> Coral TPU images built..."
echo "### LOG --> Pushing images..."
# docker push s7117/ubuntu-coraltpu:latest

# CUDA
echo "### LOG --> BUILDING CUDA IMAGES..."
docker buildx build -f ./cuda/11.8/Dockerfile --no-cache \
                        --platform=linux/amd64 --push cuda \
                        --tag s7117/ubuntu-cuda:11.8
docker buildx build -f ./cuda/12.2/Dockerfile --no-cache \
                        --platform=linux/amd64 --push cuda \
                        --tag s7117/ubuntu-cuda:12.2
docker buildx build -f ./cuda/12.4/Dockerfile --no-cache \
                        --platform=linux/amd64 --push cuda \
                        --tag s7117/ubuntu-cuda:12.4
docker buildx build -f ./cuda/12.6/Dockerfile --no-cache \
                        --platform=linux/amd64 --push cuda \
                        --tag s7117/ubuntu-cuda:12.6
echo "### LOG --> CUDA images built..."
echo "### LOG --> Pushing images..."
# docker push s7117/ubuntu-cuda:11.8
# docker push s7117/ubuntu-cuda:12.2
# docker push s7117/ubuntu-cuda:12.4
# docker push s7117/ubuntu-cuda:12.6

# CUDA Conda
echo "### LOG --> BUILDING GPU CONDA IMAGES..."
docker buildx build -f ./cuda-conda/11.8/Dockerfile --no-cache \
                        --platform=linux/amd64 --push cuda-conda \
                        --tag s7117/ubuntu-cuda-conda:11.8
docker buildx build -f ./cuda-conda/12.2/Dockerfile --no-cache \
                        --platform=linux/amd64 --push cuda-conda \
                        --tag s7117/ubuntu-cuda-conda:12.2
docker buildx build -f ./cuda-conda/12.4/Dockerfile --no-cache \
                        --platform=linux/amd64 --push cuda-conda \
                        --tag s7117/ubuntu-cuda-conda:12.4
docker buildx build -f ./cuda-conda/12.6/Dockerfile --no-cache \
                        --platform=linux/amd64 --push cuda-conda \
                        --tag s7117/ubuntu-cuda-conda:12.6
echo "### LOG --> CUDA-CONDA images built..."
echo "### LOG --> Pushing images..."
# docker push s7117/ubuntu-cuda-conda:11.8
# docker push s7117/ubuntu-cuda-conda:12.2
# docker push s7117/ubuntu-cuda-conda:12.4
# docker push s7117/ubuntu-cuda-conda:12.6
