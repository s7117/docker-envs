# Ubuntu Docker Development Environment
*** Be sure to change the password for the user and root immediately after creating the container! ***

## Configuration/Installation
1. Install [Docker Desktop](https://www.docker.com/products/docker-desktop).
1. Start the Docker Daemon by searching for the program and starting it. It is useful to have docker always startup on login.
1. Run ```docker build . -t vanilla-mc```
1. Run ```docker run --restart unless-stopped -p 25565:25565 --name vanilla1 --hostname mc1 -dti vanilla-mc```

## Enter the shell via `docker exec` or `docker start`
- `docker start vanilla1`
- `docker attach vanilla1`
- `docker exec -ti vanilla1 /bin/bash`

Optionally, you can add the ```--restart unless-stopped``` to the ```docker run``` command to restart the docker container on docker startup.
