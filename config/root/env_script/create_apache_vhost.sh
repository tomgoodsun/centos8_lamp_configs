#!/bin/bash

APACHECTL="/sbin/apachectl"

# ServerName setting
if [ ! $1 ]; then
    echo "Server names is neccesary. Exit."
exit 0
fi
VHOST_NAME=$1

# User setting
USER=${2-webmaster}
GROUP=${3-webmaster}
SERVER_ADMIN=${4-yourname@example.com}

# Directory paths
VHOSTS_DIR="/etc/httpd/vhosts"
VHOST_CONFIG=$VHOSTS_DIR"/"$VHOST_NAME".conf"
WEB_ROOT="/var/www/vhosts"
SITE_ROOT=$WEB_ROOT"/"$VHOST_NAME
DOCUMENT_ROOT=$SITE_ROOT"/public_html"
APACHE_LOG=$SITE_ROOT"/logs/httpd"
SAMPLE_FILE=$DOCUMENT_ROOT"/index.html"
CURRENT_DATE=`date +"%Y-%m-%d %H:%M:%S"`

# Create dirctories
if [ ! -e $SITE_ROOT ]; then
    mkdir -p $SITE_ROOT $DOCUMENT_ROOT $APACHE_LOG
    echo "<html><body>Here is $VHOST_NAME.</body></html>" > $SAMPLE_FILE
    chown -R $USER:$GROUP $SITE_ROOT
    chmod -R 775 $SITE_ROOT
    echo "Creating $SITE_ROOT done."
    echo "Creating $DOCUMENT_ROOT done."
    echo "Creating $APACHE_LOG done."
else
    echo "Could not create virtual host directory $SITE_ROOT. It already exists."
fi

# Create virtual host configuration file
if [ ! -e $VHOST_CONFIG ]; then
    echo "# Virtual host $VHOST_NAME created at $CURRENT_DATE
<VirtualHost *:80>
    ServerAdmin $SERVER_ADMIN
    DocumentRoot $DOCUMENT_ROOT
    ServerName $VHOST_NAME
    ErrorLog \"|/usr/sbin/rotatelogs $APACHE_LOG/error_log.%m%d 86400 540\"
    CustomLog \"|/usr/sbin/rotatelogs $APACHE_LOG/access_log.%m%d 86400 540\" combined
</VirtualHost>" > $VHOST_CONFIG
    echo "Creating virtual host configuration file: $VHOST_CONFIG"
    echo "Please do configtest and restart apache."
else
    echo "Could not create virtual host configuration file $VHOST_CONFIG. It already"
fi

# Apache configtest
read -p "Do you want to commence apache configtest?: " CT_CHECK
if [ $CT_CHECK = 'y' -o $CT_CHECK = 'yes' ]; then
$APACHECTL configtest
fi

read -p "You can commence apachectl command. If answer 'no', process will exits.: " NEXT
if [ $NEXT_CMD = 'no' ]; then
    echo "Process did nothing."
else
    $APACHECTL $NEXT_CMD
fi

echo "Done!"

