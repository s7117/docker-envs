# Ubuntu Docker Development Environment
*** Be sure to change the password for the user and root immediately after creating the container! ***

## Configuration/Installation
1. Install [Install Docker Engine](https://docs.docker.com/engine/install/).
2. Start the Docker Daemon by running ```sudo systemctl start docker```. Use ```sudo systemctl enable docker``` to start docker on boot.
3. Give your user permission to run docker using ```sudo usermod -aG docker <username>``` 
4. Run ```docker build . -t vanilla-mc```
5. Run ```docker run --restart unless-stopped -p 25565:25565 --name vanilla1 --hostname mc1 -dti vanilla-mc```

## Enter the shell via `docker exec` or `docker start`
- `docker start vanilla1`
- `docker attach vanilla1`
- `docker exec -ti vanilla1 /bin/bash`

Optionally, you can add the ```--restart unless-stopped``` to the ```docker run``` command to restart the docker container on docker startup.
