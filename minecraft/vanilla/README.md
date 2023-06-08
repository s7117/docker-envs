# Ubuntu Docker Development Environment

**_WARNING: Be sure to change the password for the user immediately after creating the container!_**

## Configuration/Installation

1. Run: `docker build . -t vanilla-mc`
2. Run: `docker run --restart unless-stopped -p 25565:25565 --name vanilla1 --hostname mc1 -dti vanilla-mc`

## Enter the shell via `docker exec` or `docker start`

- `docker start vanilla1`
- `docker attach vanilla1`
- `docker exec -ti vanilla1 /bin/bash`

Optionally, you can add the `--restart unless-stopped` to the `docker run` command to restart the docker container on docker startup.

## Installing Other Packages:

The user password is `temp2023`. It is advised to reset this password as soon as possible upon creating the container.

Use `passwd` and `temp2023` to change the default password to a new password.
