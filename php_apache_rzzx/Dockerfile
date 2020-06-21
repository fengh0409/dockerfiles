FROM hub.hexin.cn:9082/baseimages/php_apache:php_7.2.8_apache_2.2.32

LABEL maintainer="fenghui@myhexin.com"

RUN wget http://pecl.php.net/get/apcu-5.1.12.tgz \
    && tar -xzvf apcu-5.1.12.tgz \
    && cd apcu-5.1.12 \ 
    && /usr/local/php/bin/phpize \
    && ./configure --with-php-config=/usr/local/php/bin/php-config \
    && make && make install \
    && rm -rf /usr/local/src/*
RUN wget http://pecl.php.net/get/dbase-7.0.0.tgz \
    && tar -xzvf dbase-7.0.0.tgz \
    && cd dbase-7.0.0 \ 
    && /usr/local/php/bin/phpize \
    && ./configure --with-php-config=/usr/local/php/bin/php-config \
    && make && make install \
    && rm -rf /usr/local/src/*  
RUN wget http://pecl.php.net/get/swoole-4.0.1.tgz \
    && tar -xzvf swoole-4.0.1.tgz \
    && cd swoole-4.0.1 \
    && /usr/local/php/bin/phpize \
    && ./configure --with-php-config=/usr/local/php/bin/php-config \
    && make && make install \
    && rm -rf /usr/local/src/* 
RUN wget http://pecl.php.net/get/xhprof-2.1.3.tgz \
    && tar -xzvf xhprof-2.1.3.tgz \
    && cd xhprof-2.1.3/extension \
    && /usr/local/php/bin/phpize \
    && ./configure --with-php-config=/usr/local/php/bin/php-config \
    && make && make install \
    && rm -rf /usr/local/src/*  
RUN yum install -y \
    boost-devel.x86_64 \
    gperf libevent-devel \
    libuuid-devel \
    && yum clean all
RUN wget https://launchpad.net/gearmand/1.2/1.1.12/+download/gearmand-1.1.12.tar.gz \
    && tar -xzvf gearmand-1.1.12.tar.gz \
    && cd gearmand-1.1.12 \ 
    && ./configure \
    && make && make install \
    && rm -rf /usr/local/src/* 
RUN wget https://github.com/wcgallego/pecl-gearman/archive/gearman-2.0.3.tar.gz \
    && tar -xzvf gearman-2.0.3.tar.gz \
    && cd pecl-gearman-gearman-2.0.3 \ 
    && /usr/local/php/bin/phpize \
    && ./configure --with-php-config=/usr/local/php/bin/php-config \
    && make && make install \
    && rm -rf /usr/local/src/*

COPY ./root /                  
ENV ENABLE_PRIVILEGED=true
