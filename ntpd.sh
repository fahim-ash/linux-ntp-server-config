#!/usr/bin/bash

#first e vi ntpconfig.bash diye file khule than nicher shb copy paste
#1st part ntp setup

sudo yum -y install ntp

sudo mv /etc/ntp.conf /etc/backupntp

cat > ntp.conf <<eof
driftfile /var/lib/ntp/drift
restrict default nomodify notrap nopeer noquery
restrict 127.0.0.1
restrict ::1
restrict 192.168.0.0 mask 255.255.255.0 nomodify notrap
server 0.asia.pool.ntp.org
server 1.asia.pool.ntp.org
server 2.asia.pool.ntp.org
server 3.asia.pool.ntp.org
includefile /etc/ntp/crypto/pw
keys /etc/ntp/keys
disable monitor
eof

# onno ra nijeder home add korbe 

sudo mv /home/ash/ntp.conf /etc/

systemctl start ntpd
systemctl enable ntpd

sudo firewall-cmd --add-service=ntp --permanent
sudo firewall-cmd --reload