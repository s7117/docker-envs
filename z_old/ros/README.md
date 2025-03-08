# Robot Operating System (ROS) Development Environment

**_WARNING: Be sure to change the password for the user immediately after creating the container!_**

## Configuration/Installation

1. Run: `docker pull s7117/ubuntu-ros:latest`
2. Run: `docker run --name ros -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY -it s7117/ubuntu-ros:latest`

## Enter the shell via `docker exec` or `docker start`

- `docker start -ai <container_name>`
- `docker exec -ti  <container_name> /bin/bash`
- `docker exec <container_name> <executable>`

Optionally, you can add the `--restart unless-stopped` to the `docker run` command to restart the docker container on docker startup.

## Test X Applicatons:

1. Enter the docker container.
2. Run `xeyes`.
3. A small X Window should appear with eyes and the eyes should look torwards your mous pointer as you move it.

## Installing Other Packages:

The user password is `change-this-2025`. It is advised to reset this password as soon as possible upon creating the container.

Use `passwd` and `change-this-2025` to change the default password to a new password.
