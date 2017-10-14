#!/bin/sh

addgroup -g $PGID syncthing
adduser -s /bin/false -u $PUID -G syncthing syncthing

chown -R syncthing:syncthing /home/syncthing || true

exec init
