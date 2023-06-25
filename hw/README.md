# Hardware Development Docker Images

```shell
docker run -p 5901:5901 --name hwdev --hostname hwdev -d s7117/ubunut-hw:latest
```

Inside the container run:

```shell
vncserver
```

The resulting container can be remoted into via a VNC client viewer like TigerVNC Viewer.
