# centos7_lamp_configs
Samples of configuration files for LAMP environment on CentOS 7

For more information, please see https://docs.google.com/document/d/12VbZYST8h0rxLE18c0xdS_PHvkq-AcLYVa-ONuPe5dU

# CentOS 7.x LAMP環境構築マニュアル
インストール用のOSイメージをダウンロード

- [00.初期設定](00.初期設定.md)
- [01.LAMP環境の構築](01.LAMP環境の構築.md)
- [02.時刻の設定](02.時刻の設定.md)
- [03.Samba（Windowsファイル共有）の設定](03.amba（Windowsファイル共有）の設定.md)
- [04.PHPのセットアップ](04.PHPのセットアップ.md)
- [05.ウェブサーバーのセットアップ](05.ウェブサーバーのセットアップ.md)
- [06.MySQL Serverのセットアップ](06.MySQL_Serverのセットアップ.md)

## 自動起動設定

以下のデーモンはsystemctlコマンドで自動起動設定（enable）をしておく。
自動起動設定はOS起動時に自動的に立ち上がるソフトウェアを指定すること。

- httpd
- mysqld
- ntpd
- samba
- memcached


## 最後の設定

ここで一旦rebootして、すべて正常に起動できるかを確認する。

```bash
[root@centos6 ~]# reboot
```

