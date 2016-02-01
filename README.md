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
sudo curl -O https://github.com/ckulka/rpi-btsync/blob/master/btsync.service
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
# Upload initial data to AWS S3
# Has to be done only once at the beginning
docker-compose run --rm backup sh /opt/aws-s3-sync-backup.sh

# Run the service(s)
docker-compose up

# On a regular basis, perform the backup
docker-compose run --rm backup sh /opt/aws-s3-sync-backup.sh
```
