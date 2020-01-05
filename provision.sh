#!/bin/bash

set -e

SOURCES=/vagrant
PFILES=$SOURCES/provisioning

echo "install base packages"
sudo apt-get update
sudo apt-get upgrade

sudo apt-get install -y curl nfs-common nfs-kernel-server inetutils-inetd


echo "/etc/hosts"
cp $PFILES/hosts /etc/hosts
chmod 0644 /etc/hosts

echo "/etc/inetd.conf"
cp $PFILES/inetd.conf /etc/inetd.conf
chmod 0644 /etc/inetd.conf

echo "bounce inetd"
sudo systemctl restart inetutils-inetd.service

echo "/etc/exports"
cp $PFILES/exports /etc/exports
chmod 0644 /etc/exports

echo "bounce nfs"
sudo systemctl restart nfs-kernel-server

echo "/etc/network/interfaces"
sudo cat $PFILES/interfaces >> /etc/network/interfaces

su -c "$SOURCES/provision-user.sh" vagrant

