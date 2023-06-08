# Ubuntu Machine Learning Docker Development Environment

**_WARNING: Be sure to change the password for the user immediately after creating the container!_**

This Docker image contains the necessary PyTorch and TensorFlow tools pre-installed in Miniforge3 conda environments. See the Dockerfile for more info.

# Machine Learning

**_You must use the `--gpus all` argument to the `docker run` command to pass gpus access to the containter._**

Before using this image please refer to the nvidia-docker documentation:

- https://github.com/NVIDIA/nvidia-docker
- https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/install-guide.html#docker

## Bind/Mount a Directory

If you wish to have a directory shared between the host machine and the Docker container do the following when you run the image for the first time:

`docker run --gpus all --name <container_name> --hostname <hostname> --mount type=bind,source=<localdir>,target=<containerdir> -ti s7117/docker_ml:latest`

## First Time Configuration/Installation

1. Run `docker pull s7117/docker_ml`
2. Run `docker run --gpus all --name <container_name> --hostname <hostname> -ti s7117/docker_ml`

## Re-Enter the shell via `docker exec` or `docker start`

- `docker start -ai <container_name>`
- `docker exec -u user -w /home/user -ti  <container_name> /bin/bash`
- `docker exec <container_name> <executable>`

## Conda Environments:

- `conda activate tfgpu` - TensorFlow GPU
- `conda activate torchgpu` - Pytorch GPU

For PyTorch do the following:

1. `conda create --name pytorch pytorch cudatoolkit=11.6`
2. `conda activate pytorch`

## Installing Other Packages:

The user password is `temp2023`. It is advised to reset this password as soon as possible upon creating the container.

Use `passwd` and `temp2023` to change the default password to a new password.

## Optional Setup:

Optionally, you can add the `--restart unless-stopped` to the `docker run` command to restart the docker container on docker startup.
