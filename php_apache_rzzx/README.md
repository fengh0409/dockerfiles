# 说明
认证中心所需要的php+apache基础镜像，基于hub.hexin.cn:9082/baseimages/php_apache:php_7.2.8_apache_2.2.32镜像，新增了一些PHP扩展

httpd配置文件所在路径：/etc/httpd/httpd.conf

文件根路径：/usr/local/apache2/htdocs

若有初始化的操作，请放在初始化脚本中，命名为：02-apache-init，该脚本为shell脚本

# 相关环境变量
通过环境变量开启各个扩展

* ENABLE_MONGODB=true
* ENABLE_REDIS=true
* ENABLE_MEMCACHED=true
* ENABLE_XDEBUG=true
* ENABLE_XHPROF=true
* ENABLE_GEARMAN=true
* ENABLE_SWOOLE=true
* ENABLE_APCU=true
* ENABLE_DBASE=true

开启特权模式，一般用于修改内和参数
* ENABLE_PRIVILEGED=true

# build
`docker build -t hub.hexin.cn:9082/baseimages/php_apache:php_7.2.8_apache_2.2.32_rzzx .`

