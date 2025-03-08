# Ubuntu Conda Docker Development Environment

**_WARNING: A default password has been set for the default user called `user`. The default password is `change-this-2025`. Use `passwd` along with this password to change the default password!_**

## Configuration/Installation

1. Run: `docker pull s7117/ubuntu-base`
2. Run: `docker run --name <container_name> --hostname <hostname> -ti s7117/ubuntu-base`

## Enter the shell via `docker exec` or `docker start`

- `docker start -ai <container_name>`
- `docker exec -u user -w /home/user -ti  <container_name> /bin/zsh`
- `docker exec <container_name> <executable>`

Optionally, you can add the `--restart unless-stopped` to the `docker run` command to restart the docker container on docker startup.

## Installing Other Packages:

The user password is `change-this-2025`. It is advised to reset this password as soon as possible upon creating the container.

Use `passwd` and `change-this-2025` to change the default password to a new password.
