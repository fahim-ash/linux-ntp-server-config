#!/usr/bin/bash
sudo yum -y install chrony

#vi /etc/chrony.conf

sudo mv /etc/chrony.conf /etc/backupchrony

cat > chrony.conf << eof
server 0.asia.pool.ntp.org
server 1.asia.pool.ntp.org
server 2.asia.pool.ntp.org
server 3.asia.pool.ntp.org
driftfile /var/lib/chrony/drift
makestep 1.0 3
rtcsync
allow 192.168.0.0/16
logdir /var/log/chrony
eof

#dont forget to change this home directory
sudo mv /home/ash/chrony.conf /etc/

sudo systemctl start chronyd
sudo systemctl enable chronyd

sudo firewall-cmd --add-service=ntp --permanent
sudo firewall-cmd --reload

#sudo chronyc sources  (check ntp with this command)
