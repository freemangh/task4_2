#!/bin/bash
# Mirantis Internship 2018
# Task 4.2
# Eugeniy Khvastunov
# NTP verify script
date >> /tmp/ntp_verify.tmp
CURPATH="$(pwd)"
SCRPATH="$(echo $0 | rev | cut -c 11- | rev)"
OUTFILE=$CURPATH/$SCRPATH'task4_1.out'
TMPFILE=$CURPATH/$SCRPATH'task4_1.tmp'
#echo "CURPATH: $CURPATH
#SCRPATH: $SCRPATH
#OUTFILE: $OUTFILE
#TMPFILE: $TMPFILE"
if [ -f /var/run/ntpd.pid ] ; then
        ISNTPRUN=1
else
        echo -e "NOTICE: ntp is not running"
        /usr/sbin/service ntp restart
fi
CONFMD5NOW=`/usr/bin/md5sum  /etc/ntp.conf | /usr/bin/awk '{print $1}'`
CONFMD5ETALON=`cat /etc/ntp.conf.md5`
if [ "$CONFMD5NOW" = "$CONFMD5ETALON" ] ; then
        ISNTPCONFOK=1
else
        /usr/bin/diff -ruN /etc/ntp.conf.bak /etc/ntp.conf > /etc/ntp.diff
        echo -e "NOTICE: /etc/ntp.conf was changed. Calculated diff:"
        cat /etc/ntp.diff
        /bin/cp /etc/ntp.conf.bak /etc/ntp.conf
        /usr/sbin/service ntp restart
fi
