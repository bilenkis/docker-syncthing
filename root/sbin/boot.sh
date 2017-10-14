#!/bin/sh

# this need if group already exists
if [[ `getent group $PGID` ]]; then
	GROUP_NAME=$(getent group $PGID | cut -d: -f1)
else
	GROUP_NAME="syncthing"
	addgroup -g $PGID $GROUP_NAME
fi

adduser -D -s /bin/false -u $PUID -G $GROUP_NAME syncthing

chown -R syncthing:syncthing /home/syncthing || true

exec init
