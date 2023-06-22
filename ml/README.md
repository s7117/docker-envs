# Ubuntu Machine Learning Docker Development Environment

**_WARNING: Be sure to change the password for the user immediately after creating the container!_**

This Docker image contains the necessary PyTorch and TensorFlow tools pre-installed in Miniforge3 conda environments. See the Dockerfile for more info.

## CUDA Version Tags

`10.2` = s7117/ubuntu-ml:10.2
`11.7.1` = s7117/ubuntu-ml:11.7  
`11.8.0` = s7117/ubuntu-ml:11.8  
`12.1.1` = s7117/ubuntu-ml:12.1

## GPU Access Prerequisite: nvidia-container-toolkit

**_You must use the `--gpus all` argument to the `docker run` command to pass gpus access to the containter._**

This requires installing the `nvidia-container-toolkit` prior to using the GPUs.

https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/install-guide.html

## Bind/Mount a Directory

If you wish to have a directory shared between the host machine and the Docker container do the following when you run the image for the first time:

`docker run --gpus all --name <container_name> --hostname <hostname> --mount type=bind,source=<localdir>,target=<containerdir> -ti s7117/docker-ml:<cudaversion>`

## First Time Configuration/Installation

1. Run `docker pull s7117/docker-ml`
2. Run `docker run --gpus all --name <container_name> --hostname <hostname> -ti s7117/docker-ml`

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
