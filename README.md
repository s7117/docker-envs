# docker_ubuntu_env
A simple Dockerfile for an Ubuntu 20.04 development environment. Portable for use with classes and projects. Also useful as an experimental sandbox.

As of now these environments are only on Ubuntu but in theory should be able to be ported to other distros by changing the `FROM` at the beginning of the Dockerfile.

## Environments
- [ubuntu_env](base/)
- [ubuntu_env_cuda](cuda/)

## Environment Considerations:
- zsh is preinstalled into the docker container and will start unless `/bin/bash` is passed in.
- My [.dotfiles](https://github.com/s7117/.dotfiles) git repository is automattically cloned into the user's home directory.
- [oh-my-posh](https://github.com/jandedobbeleer/oh-my-posh) is used for the terminal prompt generation.

***NOTE: For the zsh fonts to appear correctly please install FiraCode Nerd Font.***
