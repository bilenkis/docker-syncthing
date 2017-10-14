# Syncthing
Dockerized syncthing daemon to securely synchronize files with trusted computers

## Usage
First of all you need docker and docker-compose. 
Then edit docker-compose.yml:
1. Set PUID & PGID to run syncthing daemon with
2. Set needed **volumes**. This directories need to be selected as "Folder Path" in "Add Folder" menu
