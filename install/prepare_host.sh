#!/bin/bash -x
sudo echo never > /sys/kernel/mm/transparent_hugepage/enabled
sudo echo never > /sys/kernel/mm/transparent_hugepage/defrag
sudo yum -y install epel-release
sudo yum -y update
sudo yum install -y net-tools vim reposync curl wget unzip zip chkconfig tar openssh-clients ntp
sudo systemctl enable ntpd
sudo systemctl start ntpd
sudo sh -c "ulimit -n 10000 && exec su $LOGNAME"
sudo systemctl disable firewalld
sudo systemctl stop firewalld
sudo systemctl mask --now firewalld
sudo sed -i s/^SELINUX=.*$/SELINUX=disabled/ /etc/selinux/config
setenforce 0
sudo /sbin/reboot
