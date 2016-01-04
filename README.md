This repository provides an image for btsync (https://www.getsync.com) on Raspberry Pi.
Automated builds currently fail since Docker Hub currently doesn't support ARM platforms.

For more details, see https://github.com/ckulka/rpi-btsync


### Run
```
docker run --rm -it -p 5555:5555 -p 8888:8888 ckulka/rpi-btsync
```
You can now access the Web UI via http://your-raspberry-pi:8888

### Volumes
The configuration and storage folders of the default configuration are both inside ```/home/btsync/```. This directory should be part of a regular backup.

