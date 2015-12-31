# Set the base image
FROM resin/rpi-raspbian:latest

# File Author / Maintainer
MAINTAINER Cyrill Kulka


## BEGIN INSTALLATION

# Create a separate btsync user
RUN useradd -m -u 1000 btsync
RUN mkdir /home/btsync/config /home/btsync/folders && chown -R btsync:btsync /home/btsync

# Add the configuration file
COPY files/btsync.conf /home/btsync/

# Install btsync
COPY files/btsync.list /etc/apt/sources.list.d/
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 40FC0CD26BF18B15 && \
	apt-get update && apt-get install -y btsync && apt-get clean


## IMAGE CONFIGURATION

# Expose WebUI and sync port
EXPOSE 8888 55555

# Volume for persistent files
VOLUME /home/btsync

# Start btsync
USER btsync
CMD [ "/usr/lib/btsync/btsync-daemon", "--nodaemon", "--config", "/home/btsync/btsync.conf" ]
