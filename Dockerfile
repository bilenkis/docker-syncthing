FROM alpine:3.6

LABEL maintainer Yury Bilenkis <adm@bilenkis.ru>

CMD ["/sbin/boot.sh"]

ENV SYNCTHING_VERSION="v0.14.39"

RUN set -xe ;\
    apk --no-cache add \
        ca-certificates \
        openssl \
	;\
    wget -qO /usr/bin/gosu "https://github.com/tianon/gosu/releases/download/1.10/gosu-amd64" ;\
    chmod +x /usr/bin/gosu

RUN set -xe;\
    cd /tmp ;\
    wget -qO- https://github.com/syncthing/syncthing/releases/download/${SYNCTHING_VERSION}/syncthing-linux-amd64-${SYNCTHING_VERSION}.tar.gz | tar xz ;\
    mv /tmp/syncthing-linux-amd64-${SYNCTHING_VERSION}/syncthing /usr/bin/syncthing ;\
    rm -rf /tmp/* ;\
    chmod +x /usr/bin/syncthing

COPY root/ /
