# 说明
* prepare.sh 用于安装编译php 的前置依赖安装 gcc g++ curl 等等
* extensions.sh 用于安装php比较通用的扩展 但不会在系统中默认加载

#  build
* `docker build -t hub.hexin.cn:9082/baseimages/php_apache:php_7.2.8_apache_2.2.32 .`

# 系统版本
* centos 6.9

# 目录
* php 目录 /usr/local/php/
* php 配置文件 /usr/local/php/etc/php.ini
* httpd 目录 /usr/local/apache2
* httpd配置文件所在路径：/etc/httpd/httpd.conf

# env
* 启动时可用的环境变量配置:
* THS_TIER string 运行模式由业务方自定义（大致分为测试环境:test |预发布环境:preview | 正式环境:formal）
* ENABLE_MONGODB,ENABLE_REDIS,ENABLE_MEMCACHED,ENABLE_XDEBUG  bool值 true表示启用该扩展，默认不启用
* LOGPATH 字符串 传参目录（配置日志） 可以替换fpm慢日志，php错误日志的存放路径 /结尾
* CODEPATH 字符串 代码目录 /结尾

# 运行依赖标准
```
CODEPATH
└───.builddep
    └───$THS_TIER       运行模式匹配的环境变量的目录：比如运行模式是formal 那目录名就是:formal 如果RUN_MODE指定的不存在或者没制定，但是目录下default目录存在，则执行default下文件
        │   init        业务服务初始化需要执行的脚本类似 rc.local 
        │   crontab     rontab文件 会把文件内容复制到/etc/crontab
        │   hosts       hosts文件 会把文件内容复制到/etc/hosts
```
* 需要在容器启动的时候配置CODEPATH环境变量 用于标识代码目录，业务方在代码目录下配置.builddep目录用于存放相关启动脚本与配置等

# php
* 默认可执行 php,phpunit(6.5.5),composer

# 服务
* 默认打开sshd 服务 默认密码：10jqka
* 默认打开crond 服务 /etc/crontab

