FROM centos:6.9

LABEL maintainer="fenghui@myhexin.com"

RUN cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

ADD s6-overlay-amd64.tar.gz /

COPY 01-init /etc/cont-init.d/01-init

WORKDIR /var/www/html

ENTRYPOINT ["/init"]
