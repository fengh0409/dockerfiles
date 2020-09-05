#!/bin/bash
set -e
set -x

dir='http://pecl.php.net/get/'
curl -SL $dir'mongodb-1.5.2.tgz' | tar -xvzC /usr/local/src
curl -SL https://launchpad.net/libmemcached/1.0/1.0.18/+download/libmemcached-1.0.18.tar.gz | tar -xvzC /usr/local/src
curl -SL $dir'memcached-3.0.3.tgz' | tar -xvzC /usr/local/src
curl -SL https://github.com/phpredis/phpredis/archive/3.1.4.tar.gz | tar -xvzC /usr/local/src
curl -SL $dir'xdebug-2.6.0.tgz' | tar -xvzC /usr/local/src

#mongodb
cd /usr/local/src/mongodb-1.5.2/ && /usr/local/php/bin/phpize &&  ./configure --with-php-config=/usr/local/php/bin/php-config && make && make install
#memcached
cd /usr/local/src/libmemcached-1.0.18/ &&  ./configure && make && make install 
cd /usr/local/src/memcached-3.0.3/ && /usr/local/php/bin/phpize &&  ./configure --with-php-config=/usr/local/php/bin/php-config --enable-memcache && make && make install
#phpredis
cd /usr/local/src/phpredis-3.1.4/ && /usr/local/php/bin/phpize &&  ./configure --with-php-config=/usr/local/php/bin/php-config && make && make install
#xdebug
cd /usr/local/src/xdebug-2.6.0/ && /usr/local/php/bin/phpize &&  ./configure --with-php-config=/usr/local/php/bin/php-config && make && make install

#composer
php -r "copy('https://install.phpcomposer.com/installer', 'composer-setup.php');"
php composer-setup.php
php -r "unlink('composer-setup.php');"
mv composer.phar /usr/local/bin/composer
chmod +x /usr/local/bin/composer
composer config -g secure-http false
composer config -g -- disable-tls true
composer config -g repo.packagist composer https://packagist.phpcomposer.com

#phpunit
curl -O https://phar.phpunit.de/phpunit-6.5.5.phar
chmod +x phpunit-6.5.5.phar
mv phpunit-6.5.5.phar /usr/local/bin/phpunit

#clean
rm -rf /usr/local/src/*
