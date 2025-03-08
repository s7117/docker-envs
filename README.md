# My Docker Environments

A simple Dockerfile for an Ubuntu 22.04 development environment. Portable for use with classes, projects, development, research, and more. It is also useful as an experimental sandbox and packaging your work for reproducible work for dissemination.

As of now these environments are only on Ubuntu but in theory should be able to be ported to other distros by changing the `FROM` at the beginning of the Dockerfile. Keep in mind you may need to change the package manager and other distro-specific commands in the Dockerfile.

**_WARNING: A default password has been set for the default user called `user`. The default password is `change-this-2025`. Use `passwd` along with this password to change the default password!_**

## Basic Usage:

While the basic use command will work, looking at the `readme.md` file in each respective directory will yield better results and more granular functionality.

```shell
docker run --name <container-name> -ti s7117/ubuntu-<suffix>:<tag>
```

## Continued Usage:

**_WARNING: Do NOT use the `docker start` command to launch additional shells. See [Launching a second shell](#launching-a-second-shell) for this information._**

### Starting a stopped container:

To continue to use a container that was created by using the `docker run` command above use the following **once**:

```shell
docker start -ai <container-name>
```

**_NOTE: If you did not name your container use `docker container ls -a` to determine the Docker randomly assigned name/id._**

### Launching a second shell:

Use the following command on a running Docker container to launch a new shell in the container (you can replace `/bin/bash` with another command if you would like to run another shell/command):

```
docker exec -ti <container-name> /bin/bash
```

### Stopping a container:

Use the following command to stop/terminate a running container:

```shell
docker stop <container-name>
```

## Detailed Usage:

See the `README.md` in each respective directory for specific usage instructions and details.

See [docs/common-docker.md](docs/common-docker.md) for some common docker commands and their definitions.

## Environments

- [ubuntu-base](base/) - Customized Ubuntu Development Environment
- [ubuntu-conda](conda/) - Ubuntu Image with Miniforge3 installed
- [ubuntu-coraltpu](coraltpu/) - Ubuntu Image with the Coral TPU tools installed
- [ubuntu-cuda](cuda/) - Customized CUDA Image
- [ubuntu-cuda-conda](cuda-conda/) - CUDA Images with Miniforge3 installed

## Confirming Device Passthrough

Use `lsusb` and `lspci` to confirm that the devices desired to be accessible in the Docker container appear.

### GPU Passthrough

Check that TensorFlow/PyTorch can see the GPU:

```python
>>> # TensorFlow
>>> import tensorflow as tf
>>> tf.config.list_physical_devices('GPU')
>>> tf.sysconfig.get_build_info()['cuda_version']
>>> # PyTorch
>>> import torch
>>> torch.cuda.is_available()
>>> torch.version.cuda
```

## Docker Aliases

If you want some easy and quick shortcuts for using Docker consider taking a look at my [.dotfiles](https://github.com/s7117/.dotfiles) GitHub repository!

Some simple examples:

- `dils`: list all Docker images
- `dcls`: list all Docker containers
- `drmi`: delete a Docker image
- `drmc`: delete a Docker container
- `dclean`: delete all Docker containers and images and prune caches.
