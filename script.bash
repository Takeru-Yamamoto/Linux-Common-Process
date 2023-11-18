#!/usr/bin/env bash

# コメントの表示
echo ""
echo "--------------------------------------------------"
echo "Start Setup Linux Server."
echo "--------------------------------------------------"
echo ""

# 各種インストール & アップデート

## タイムゾーンの設定
timedatectl set-timezone Asia/Tokyo

## パッケージのアップデート
dnf -y update
dnf -y upgrade --refresh

## パッケージのインストール
dnf -y groupinstall base
dnf -y groupinstall development
dnf -y install yum-utils

## リポジトリの追加 EPEL
dnf -y config-manager --set-enabled crb
dnf -y install epel-release
dnf -y install epel-next-release

## リポジトリの追加 Remi
dnf -y install https://rpms.remirepo.net/enterprise/remi-release-9.rpm
dnf -y config-manager --set-enabled remi

## 不要なサービスの停止
systemctl disable atd
systemctl disable kdump
systemctl disable mdmonitor

## 不要なパッケージの削除
dnf remove -y cockpit

# SELinuxの無効化
sed -i -e "s/SELINUX=enforcing/SELINUX=disabled/g" /etc/selinux/config
setenforce 0

# コメントの表示
echo ""
echo "--------------------------------------------------"
echo "Complete Setup Linux Server."
echo "Execute reboot after 10 seconds."
echo "--------------------------------------------------"
echo ""

# サーバーの再起動
sleep 10

echo "Rebooting..."

reboot
