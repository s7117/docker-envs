# Ubuntu CUDA Docker Development Environment

**_WARNING: Be sure to change the password for the user immediately after creating the container!_**

## CUDA Version Tags

`11.7.1` = s7117/ubuntu_cuda:11.7  
`11.8.0` = s7117/ubuntu_cuda:11.8  
`12.1.1` = s7117/ubuntu_cuda:12.1  

## GPU Access Prerequisite: nvidia-container-toolkit

**_You must use the `--gpus all` argument to the `docker run` command to pass gpus access to the containter._**

This requires installing the `nvidia-container-toolkit` prior to using the GPUs.

https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/install-guide.html

## Configuration/Installation

1. Run: `docker pull s7117/ubuntu_cuda:<cudaversion>`
2. Run: `docker run --gpus all --name <container_name> --hostname <hostname> -ti s7117/ubuntu_cuda:<cudaversion>`

## Enter the shell via `docker exec` or `docker start`

- `docker start -ai <container_name>`
- `docker exec -u user -w /home/user -ti  <container_name> /bin/zsh`
- `docker exec <container_name> <executable>`

Optionally, you can add the `--restart unless-stopped` to the `docker run` command to restart the docker container on docker startup.

## Installing Other Packages:

The user password is `temp2023`. It is advised to reset this password as soon as possible upon creating the container.

Use `passwd` and `temp2023` to change the default password to a new password.
