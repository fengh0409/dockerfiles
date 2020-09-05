FROM centos:7

LABEL maintainer="fengh0409@gmail.com"

RUN useradd www

RUN yum install -y \
 make \
 autoconf \
 curl \
 curl-devel \
 freetype-devel \
 gcc \
 gcc-c++ \
 libcurl-devel \
 openssl-devel.i686 \
 openssl-devel  \
 openldap-devel \
 tar && \
 yum clean all

COPY ./script /build

RUN sh /build/prepare.sh

ADD https://github.com/just-containers/s6-overlay/releases/download/v2.0.0.1/s6-overlay-amd64.tar.gz /

COPY ./root /

EXPOSE 80

ENTRYPOINT ["/init"]
