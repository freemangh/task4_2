#!/bin/bash
# Mirantis Internship 2018
# Task 4.2
# Eugeniy Khvastunov
# NTP deploy script
CURPATH="$(pwd)"
SCRPATH="$(echo $0 | rev | cut -c 14- | rev)"
OUTFILE=$CURPATH/$SCRPATH'ntp_verify.sh'
/usr/bin/apt-get update
/usr/bin/apt-get -y install ntp
/bin/cp /etc/ntp.conf /etc/ntp.original
/bin/cat /etc/ntp.original | /bin/sed '/^pool/d' | /bin/sed '/^server/d' > /etc/ntp.conf
echo 'server ua.pool.ntp.org iburst prefer' >> /etc/ntp.conf
/usr/bin/md5sum  /etc/ntp.conf | /usr/bin/awk '{print $1}' > /etc/ntp.conf.md5
/bin/cp /etc/ntp.conf /etc/ntp.conf.bak
/usr/sbin/service ntp restart
echo "* *    * * *   root    $OUTFILE" >> /etc/crontab
