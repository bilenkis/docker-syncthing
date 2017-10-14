#!/bin/sh

addgroup -g $PGID syncthing
adduser -s /bin/false -u $PUID -G syncthing syncthing

exec init
