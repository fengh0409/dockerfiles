FROM hub.hexin.cn:9082/baseimages/centos:6.9

LABEL maintainer="fenghui@myhexin.com"

WORKDIR /usr/local/src

COPY ./script/prepare.sh /ths_build/prepare.sh
RUN sh /ths_build/prepare.sh

# install apache
RUN wget http://ftp.tsukuba.wide.ad.jp/software/apache//apr/apr-1.6.5.tar.gz \
    && tar -xzvf apr-1.6.5.tar.gz \
    && cd apr-1.6.5 \
    && sed -i "s/\$RM \"\$cfgfile\"/\$RM -f \"\$cfgfile\"/g" configure \
    && ./configure --prefix=/usr/local/apr \
    && make && make install \
    && wget http://ftp.tsukuba.wide.ad.jp/software/apache//apr/apr-util-1.6.1.tar.gz \
    && tar -xzvf apr-util-1.6.1.tar.gz \
    && cd apr-util-1.6.1 \
    && ./configure --prefix=/usr/local/apr-util --with-apr=/usr/local/apr \
    && make && make install \
    && rm -rf /usr/local/src/*
ADD httpd-2.2.32.tar.gz /usr/local/src
RUN cd httpd-2.2.32 \
    && ./configure --prefix=/usr/local/apache2 --sysconfdir=/etc/httpd/ --enable-so --enable-ssl --enable-headers --enable-rewrite --with-pcre --with-mpm=prefork --with-apr=/usr/local/apr --with-apr-util=/usr/local/apr-util \
    && make && make install \
    && ln -sf /usr/local/apache2/bin/httpd /usr/local/bin/httpd \
    && rm -rf /usr/local/src/*

# install php
RUN wget https://www.php.net/distributions/php-7.2.8.tar.gz \
    && tar -xzvf php-7.2.8.tar.gz \
    && cd php-7.2.8 \
    && ./configure  '--prefix=/usr/local/php' '--with-apxs2=/usr/local/apache2/bin/apxs' '--with-config-file-path=/usr/local/php/etc' '--with-mysqli=mysqlnd' '--with-freetype-dir' '--with-jpeg-dir' '--with-png-dir' '--with-zlib' '--with-libxml-dir=/usr' '--enable-xml' '--disable-rpath' '--enable-bcmath' '--enable-shmop' '--enable-sysvsem' '--enable-inline-optimization' '--with-curl' '--enable-mbregex' '--enable-fpm' '--enable-mbstring' '--with-gd' '--with-openssl' '--with-mhash' '--enable-pcntl' '--enable-sockets' '--with-ldap' '--with-ldap-sasl' '--with-xmlrpc' '--enable-zip' '--enable-soap' '--with-pdo-mysql' '--with-pdo-pgsql' '--disable-cgi' '--enable-mysqlnd' '--with-libdir=lib64' \
    && make && make install \
    && ln -s /usr/local/php/bin/php /usr/local/bin/php \
    && ln -s /usr/local/php/bin/php /bin/php \
    && ls -l /usr/local/php/bin \
    && ls -l /usr/local/php \
    && rm -rf /usr/local/src/*

# install php extension
COPY ./script/extensions.sh /ths_build/extensions.sh
RUN sh /ths_build/extensions.sh

# install supervisor
ADD src/s6-overlay-amd64.tar.gz /

COPY ./root /
ENV ENABLE_MONGODB=false \
    ENABLE_REDIS=false \
    ENABLE_MEMCACHED=false \
    ENABLE_XDEBUG=false \
    ENABLE_ENV=false \
    LOGPATH=/data/logs/ \
    CODEPATH=/usr/local/apache2/htdocs/ \
    ENABLE_CROND=true \
    PHP_AUTO_PREPEND_FILE="" \
    S6_BEHAVIOUR_IF_STAGE2_FAILS=2

ENTRYPOINT ["/bin/sh", "-c", "test -f /dev/shm/initenv && sh /dev/shm/initenv; test -f /dev/shm/environment && source /dev/shm/environment; /init"]
