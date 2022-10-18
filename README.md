# docker_env
A simple Dockerfile for an Ubuntu 20.04 development environment. Portable for use with classes and projects. Also useful as an experimental sandbox.

As of now these environments are only on Ubuntu but in theory should be able to be ported to other distros by changing the `FROM` at the beginning of the Dockerfile.

## Environments
- [docker_env](base/) - Customized Ubuntu Development Environment
- [docker_env_cuda](cuda/) - Customized CUDA Image
- [docker_env_ml](ml/) - Machine Learning Image with PyTorch and TensorFlow GPU installed under Miniforge3

## Environment Considerations:
- zsh is preinstalled into the docker container and will start unless `/bin/bash` is passed in.
- My [.dotfiles](https://github.com/s7117/.dotfiles) git repository is automattically cloned into the user's home directory.
- [oh-my-posh](https://github.com/jandedobbeleer/oh-my-posh) is used for the terminal prompt generation.
- To use my oh-my-posh theme you will need to install the [FiraCode Nerd Font](https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/FiraCode.zip). Place the fonts in `~/.fonts` and then run `fc-cache -f -v`.

## Build Instructions
### Base
1. `docker buildx create --name ubuntu_env --use`
1. `docker buildx build --no-cache --tag s7117/docker_env:latest --platform=linux/amd64,linux/arm64 --push .`

### CUDA
1. `docker build --no-cache --tag s7117/docker_env_cuda:latest --push .`

### Machine Learning
1. `docker build --no-cache --tag s7117/docker_env_ml:latest --push .`
