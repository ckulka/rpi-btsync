# Resilio Sync for Raspberry Pi

**DEPRECATED:** This repository has moved to [ckulka/sync-docker](https://github.com/ckulka/sync-docker) and the [ckulka/btsync](https://hub.docker.com/r/ckulka/btsync/) image which now also support ARM devices like Raspberry Pi. Multi-arch support might be available at [resilio/sync](https://hub.docker.com/r/resilio/sync/) once [PR-26](https://github.com/bt-sync/sync-docker/pull/26) is accepted and merged.

This repository provides an image for btsync (https://www.getsync.com) on Raspberry Pi.
Automated builds currently fail since Docker Hub currently doesn't support ARM platforms.

For more details, see https://github.com/ckulka/rpi-btsync


### Run
```
docker run --rm -it -p 5555:5555 -p 8888:8888 ckulka/rpi-btsync
```
You can now access the Web UI via http://your-raspberry-pi:8888

#### Systemd
I also included a Systemd service file.
```
sudo curl -O https://raw.githubusercontent.com/ckulka/rpi-btsync/master/btsync.service
# Adjust the location of the docker-compose.yml

sudo systemctl enable btsync.service
```
This automatically starts the service after your Raspberry Pi booted.

### Persistent Data
The configuration and storage folders of the default configuration are both inside ```/home/btsync/```. This directory should be part of a regular backup.

#### Backup to AWS S3
I backup my persistent data to AWS S3 (https://aws.amazon.com/de/s3).

My docker-compose file: https://github.com/ckulka/rpi-btsync/blob/master/docker-compose.yml
```
# Start the container
docker-compose up btsync

# On a regular basis, perform the backup
docker-compose run --rm backup sh /opt/aws-s3-sync-backup.sh

# To spawn a new docker container and use your backup from AWS, use the command below.
# Wait until it's done and then start the container as mentioned above.
docker-compose up backup
```
