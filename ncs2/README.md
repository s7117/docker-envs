# Ubuntu + NCS2 Docker Development Environment

**_WARNING: Be sure to change the password for the user immediately after creating the container!_**

This Docker container comes pre-installed with OpenVINO 2022.3.1 pre-installed for compatibility with the Intel Neural Computer Stick 2.

## Tags Available:

Two tags are available: `arm64` and `x86` depending on your host CPU's architecture.

## Configuration/Installation

1. Download/pull the Docker image using:

```shell
docker pull s7117/ubuntu-ncs2:tag
```

2. Run the Docker image using:

```shell
docker run --device-cgroup-rule='c 189:* rmw' -v /dev/bus/usb:/dev/bus/usb --name <container_name> --hostname <hostname> -ti s7117/ubuntu-ncs2
```

## Test the Container's Connection to NCS2

Run the following command to ensure your Docker container has access to the NCS2:

```shell
python3.9 /opt/intel/openvino_2022.3.1/samples/python/hello
_query_device/hello_query_device.py
```

You should see similar output to the following:

```
[ INFO ] MYRIAD :
[ INFO ] 	SUPPORTED_PROPERTIES:
[ INFO ] 		AVAILABLE_DEVICES: 1.1.1-ma2480
[ INFO ] 		FULL_DEVICE_NAME: Intel Movidius Myriad X VPU
[ INFO ] 		OPTIMIZATION_CAPABILITIES: EXPORT_IMPORT, FP16
[ INFO ] 		RANGE_FOR_ASYNC_INFER_REQUESTS: 3, 6, 1
[ INFO ] 		DEVICE_THERMAL: UNSUPPORTED TYPE
[ INFO ] 		DEVICE_ARCHITECTURE: MYRIAD
[ INFO ] 		NUM_STREAMS: AUTO
[ INFO ] 		PERFORMANCE_HINT:
[ INFO ] 		PERFORMANCE_HINT_NUM_REQUESTS: 0
[ INFO ]
```

## Enter the shell via `docker exec` or `docker start`

- `docker start -ai <container_name>`
- `docker exec -ti  <container_name> /bin/bash`
- `docker exec <container_name> <command>`

Optionally, you can add the `--restart unless-stopped` to the `docker run` command to restart the docker container on docker startup.

## Installing Other Packages:

The user password is `temp2023`. It is advised to reset this password as soon as possible upon creating the container.

Use `passwd` and `temp2023` to change the default password to a new password.
