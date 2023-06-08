# Ubuntu Docker Development Environment

**_WARNING: Be sure to change the password for the user immediately after creating the container!_**

## Configuration/Installation

1. Run: `docker build . -t atm7`
2. Run: `docker run --restart unless-stopped -p 25565:25565 --name atm7 --hostname atm7-mc -dti atm7`

## Enter the shell via `docker exec` or `docker start`

- `docker start atm7`
- `docker attach atm7`
- `docker exec -ti atm7 /bin/bash`

Optionally, you can add the `--restart unless-stopped` to the `docker run` command to restart the docker container on docker startup.

## Installing Other Packages:

The user password is `temp2023`. It is advised to reset this password as soon as possible upon creating the container.

Use `passwd` and `temp2023` to change the default password to a new password.
