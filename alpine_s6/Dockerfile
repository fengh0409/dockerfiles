FROM alpine:3.6

LABEL maintainer="fengh0409@gmail.com"

RUN apk update && apk add ca-certificates && \
    apk add tzdata && \
    ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

ADD https://github.com/just-containers/s6-overlay/releases/download/v2.0.0.1/s6-overlay-amd64.tar.gz /

COPY 01-init /etc/cont-init.d/01-init

WORKDIR /var/www/html

ENTRYPOINT ["/init"]
