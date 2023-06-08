# My Docker Environments

A simple Dockerfile for an Ubuntu 20.04 development environment. Portable for use with classes and projects. Also useful as an experimental sandbox.

As of now these environments are only on Ubuntu but in theory should be able to be ported to other distros by changing the `FROM` at the beginning of the Dockerfile.

## Basic Usage:

While the basic use command will work, looking at the `readme.md` file in each respective directory will yield better results.

```shell
docker run -ti s7117/ubuntu_<suffix>:<tag>
```

## Detailed Usage:

See the `README.md` in each respective directory for specific usage instructions and details.

See [docs/common-docker.md](docs/common-docker.md) for some common docker commands and their definitions.

```shell
# base
base/README.md
# cuda
cuda/README.md
# ml
ml/README.md
```

## Environments

- [ubuntu_env](base/) - Customized Ubuntu Development Environment
- [ubuntu_cuda](cuda/) - Customized CUDA Image
- [ubuntu_ml](ml/) - Machine Learning Image with PyTorch (torchgpu) and TensorFlow GPU (tfgpu) installed under Miniforge3

## Environment Considerations:

- My [.dotfiles](https://github.com/s7117/.dotfiles) git repository is automattically cloned into the user's home directory.

## Build Instructions

See [build.sh](./build.sh) for more details.

To build all images includes in this repo, simply run the [build.sh](./build.sh) script:

```shell
bash build.sh
# OR
./build.sh
```
