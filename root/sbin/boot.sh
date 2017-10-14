#!/bin/bash

groupadd -g $PGID syncthing
useradd -s /bin/false -u $PUID -g $PGID --no-user-group syncthing

exec init
