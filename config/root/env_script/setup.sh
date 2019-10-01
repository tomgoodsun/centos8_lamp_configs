#!/bin/bash

cp -upv /etc/ntp.conf /etc/ntp.conf.orig

cp -upv /etc/samba/smb.conf /etc/samba/smb.conf.orig

cp -upv /etc/php.ini /etc/php.ini.orig

cp -upv /etc/httpd/conf/httpd.conf /etc/httpd/conf/httpd.conf.orig
mkdir -p /etc/httpd/vhosts /var/www/vhosts /var/www/logs/httpd /var/www/session
chown webmaster:webmaster /var/www

cp -upv /etc/my.cnf /etc/my.cnf.orig

