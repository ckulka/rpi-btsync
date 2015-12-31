This repository provides a Dockerfile for btsync (https://www.getsync.com) on Raspberry Pi.

# Build Docker Image

```
# Shell working directory is where this README.md is
docker build -t ckulka/rpi-btsync .
docker run --rm -it -p 8888:8888 -p 5555:5555 ckulka/btsync
```

# Volumes

The configuration and storage folders of the default configuration are both inside ```/home/btsync/```.

