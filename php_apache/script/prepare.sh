#!/bin/bash
set -e
set -x

useradd 10jqka
useradd www

yum install -y \
 autoconf  \
 curl \
 curl-devel \
 crontabs \
 freetype-devel \
 gcc \
 gcc-c++ \
 gcc-g77 \
 libjpeg-devel  \
 libpng-devel \
 libcurl-devel \
 postgresql-devel \
 libxml2 \
 libxml2-devel \
 openssh-clients \
 openssh-server  \
 openssl-devel.i686 \
 openssl-devel  \
 openldap-devel \
 expat-devel \
 pcre-devel \
 wget \
 tar \
 automake \
 make 

cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
cp -frp /usr/lib64/libldap* /usr/lib/ 

sed -ri 's/.*pam_loginuid.so/#&/' /etc/pam.d/crond
sed -i '/session    required   pam_loginuid.so/c\#session    required   pam_loginuid.so' /etc/pam.d/crond
ssh-keygen -f /etc/ssh/ssh_host_rsa_key
ssh-keygen -t dsa -f /etc/ssh/ssh_host_dsa_key
sed -i '/pam_loginuid.so/c session    optional     pam_loginuid.so'  /etc/pam.d/sshd

