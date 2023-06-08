# Common Docker Commands

## Docker Attach

### `docker attach cname`: attach current terminal to a docker containers STDIO stream

## Docker Build

## Docker Containers

### `docker container ls -a`: lists all docker containers

### `docker container rm`: removes a container by name or id

### `docker container stop`: stops a container

## Docker Exec

### `docker exec cname command`: execute a command inside of a docker container.

### `docker exec -ti cname /bin/bash`: start a bash terminal inside the docker container

### `docker exec cname lsusb`: list the usb devices inside the docker container.

## Docker Images

### `docker image rm`: removes an image by name or id

### `docker image ls -a`: lists all docker images

## Docker Run

### `docker run --rm`: removes the container on exit

### `docker run --gpus all`: allows gpu container access

### `docker run --hostname`: set the docker container hostname

### `docker run --name`: set the container name

### `docker run -ti`: -t = tty, -i = interactive

### `docker run --privileged`: gives extra privileges to container

### `docker run -v /dev/bus/usb:/dev/bus/usb/`: Mounds usb devices to the docker container

### `docker run -v /dev:/dev`: mounts devices to docker container

### `docker run --mount type=bind,source=<localdir>,target=<containerdir>`: bind a local directory to a directory in the docker container

### `docker run --restart unless-stopped`: auto restart container unless docker stop is invoked

## Docker Start

### `docker start -ai`: start container by name or id

## Docker Volumes
