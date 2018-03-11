#!/bin/bash

url=$1
image=chrome-fedora

snd_opts="-e PULSE_SERVER=unix:${XDG_RUNTIME_DIR}/pulse/native \
	-v ${XDG_RUNTIME_DIR}/pulse/native:${XDG_RUNTIME_DIR}/pulse/native:Z"

user_opts="-u $(id -u) \
	-e USER=$USER \
	-e USERNAME=$USERNAME \
	-e LOGNAME=$LOGNAME \
  --group-add $(getent group audio | cut -d: -f3)"

dbus_opts="-v /var/run/dbus:/var/run/dbus:Z \
	-v /var/run/dbus:/run/dbus:Z \
	-v /etc/machine-id:/etc/machine-id:ro \
	-e DBUS_SESSION_BUS_ADDRESS=$DBUS_SESSION_BUS_ADDRESS"

docker run \
-it \
--rm \
--net host \
-v /tmp/.X11-unix:/tmp/.X11-unix \
-e DISPLAY=unix$DISPLAY \
-v $HOME/Downloads:/Downloads \
-v $HOME/.config/docker-data/google-chrome:/data \
--security-opt seccomp=$HOME/chrome.json \
--device /dev/snd \
--device /dev/dri \
-v /dev/shm:/dev/shm \
-v /run/user/1000/bus:/run/user/1000/bus \
$snd_opts \
$dbus_opts \
--name chrome \
$image $url