#!/bin/bash
set -e
set -x

ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

# install zlib for nginx
curl -SL https://www.zlib.net/fossils/zlib-1.2.8.tar.gz | tar -xvzC /usr/local/src
cd /usr/local/src/zlib-1.2.8 && ./configure && make && make install

# install pcre for nginx
curl -SL https://sourceforge.net/projects/pcre/files/pcre/8.31/pcre-8.31.tar.gz | tar -xvzC /usr/local/src
cd /usr/local/src/pcre-8.31 && ./configure && make && make install

# install nginx
curl -SL http://nginx.org/download/nginx-1.16.1.tar.gz | tar -xvzC /usr/local/src
cd /usr/local/src/nginx-1.16.0/
./configure --prefix=/usr/local/nginx && make && make install

# clean 
rm -rf /usr/local/src/*
