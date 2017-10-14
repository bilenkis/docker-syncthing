FROM ubuntu:16.04

LABEL maintainer Yury Bilenkis <adm@bilenkis.ru>

CMD ["/sbin/boot.sh"]

RUN set -xe ;\
    export DEBIAN_FRONTEND=noninteractive ;\
    sed -i -e 's|archive.ubuntu.com|mirror.yandex.ru|g' /etc/apt/sources.list ;\
    apt-get update -qq  ;\
    apt-get install --no-install-recommends -qq \
		ca-certificates \
		apt-transport-https \
		curl ;\
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN set -xe;\
	curl -sLo /usr/bin/gosu "https://github.com/tianon/gosu/releases/download/1.10/gosu-amd64" ;\
    chmod +x /usr/bin/gosu

RUN curl -s https://syncthing.net/release-key.txt | apt-key add - ;\
	echo "deb https://apt.syncthing.net/ syncthing stable" > /etc/apt/sources.list.d/syncthing.list ;\
	apt-get update ;\
	apt-get install syncthing ;\
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY root/ /
