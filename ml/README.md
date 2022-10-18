# Ubuntu Machine Learning Docker Development Environment
*** Be sure to change the password for the user and root immediately after creating the container! ***

This Docker image contains the necessary PyTorch and TensorFlow tools pre-installed in Miniforge3 conda environments. See the Dockerfile for more info.

# Machine Learning
*** You must use the `--gpus all` argument to the `docker run` command to pass gpus access to the containter. ***

Before using this image please refer to the nvidia-docker documentation:
- https://github.com/NVIDIA/nvidia-docker
- https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/install-guide.html#docker

## Configuration/Installation
1. Install [Docker Desktop](https://www.docker.com/products/docker-desktop).
1. Start the Docker Daemon by searching for the program and starting it. It is useful to have docker always startup on login.
1. Run ```docker pull s7117/ubuntu_env_ml```
1. Run ```docker run --gpus all --name <container_name> --hostname <hostname> -ti s7117/ubuntu_env_ml```

## Enter the shell via `docker exec` or `docker start`
- `docker start -ai <container_name>`
- `docker exec -u user -w /home/user -ti  <container_name> /bin/zsh`
- `docker exec <container_name> <executable>`

## Conda Environments:
- `conda activate tfgpu` - TensorFlow GPU
- `conda activate pytorch` - PyTorch

## Installing Other Packages:
The user password is `temp2022`. It is advised to reset this password as soon as possible upon creating the container.

## Optional Setup:
Optionally, you can add the ```--restart unless-stopped``` to the ```docker run``` command to restart the docker container on docker startup.
