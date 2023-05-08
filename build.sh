#!/bin/bash

# Create docker build environment
docker buildx create --name ubuntu_env --use

# Base
docker buildx build --no-cache --tag s7117/ubuntu_base:latest --platform=linux/amd64,linux/arm64 --push base

# CUDA
docker buildx build --no-cache --tag s7117/ubuntu_cuda:latest --platform=linux/amd64 --push cuda

# ML
docker buildx build --no-cache --tag s7117/ubuntu_ml:latest --platform=linux/amd64 --push ml

# OpenVINO
docker buildx build --no-cache --tag s7117/ubuntu_openvino:latest --platform=linux/amd64,linux/arm64 --push openvino
