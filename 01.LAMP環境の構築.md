## LAMP環境の構築

### LAMP環境作成に必要なパッケージのインストール

```bash
[root@centos7 ~]# yum install httpd php php-bcmath php-captchaphp php-cli php-common php-dba php-devel \
php-apc php-embedded php-enchant php-fpdf php-fpdf-doc php-fpm php-gd php-geshi php-imap php-interbase \
php-intl php-ldap php-libdmtx php-magpierss php-mbstring php-mcrypt php-mysqlnd php-oauth php-odbc \
php-opcache php-pdo php-pear php-pecl-imagick php-pecl-memcache php-pecl-memcached php-pecl-zip php-pgsql \
php-php-gettext php-process php-pspell php-recode php-shout php-simplepie php-snmp php-soap php-tidy \
php-xml php-xmlrpc php-yaml php-zipstream mysql-server mysql-client memcached samba mailx
```

#### Apacheをインストールする場合

```bash
[root@centos7 ~]# yum install httpd

# Apacheの最新版のインストール
[root@centos7 ~]# yum remove httpd httpd-devel httpd-tools mod_ssl
[root@centos7 ~]# yum --enablerepo=epel install nghttp2
[root@centos7 ~]# yum install mailcap
[root@centos7 ~]# yum --disablerepo=base,extras,updates --enablerepo=ius install httpd httpd-devel mod_ssl
```

#### nginxをインストールする場合

```bash
[root@centos7 ~]# yum install nginx php-fpm
```

### 基本フォルダの設置

```bash
[root@centos7 ~]# chown -R webmaster:webmaster /var/www
```

### セキュリティの設定

まずSELINUXの設定を切る。

```bash
[root@centos7 ~]# cp /etc/selinux/config /etc/selinux/config.orig
[root@centos7 ~]# setenforce 0
[root@centos7 ~]# getenforce
Permissive
[root@centos7 ~]# vi /etc/selinux/config
SELINUX=disabled
```

次にfirewalldをOFFにする。
CentOS 7ではiptablesに変わり、アクセス制限にfirewalldを使用している。

```bash
[root@centos7 ~]# systemctl stop firewalld
[root@centos7 ~]# systemctl disable firewalld
```

ここで一旦rebootして設定を反映する。

