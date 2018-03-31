#!/bin/bash
# Mirantis Internship 2018
# Task 4.2
# Eugeniy Khvastunov
# NTP verify script
CURPATH="$(pwd)"
SCRPATH="$(echo $0 | rev | cut -c 11- | rev)"
OUTFILE=$CURPATH/$SCRPATH'task4_1.out'
TMPFILE=$CURPATH/$SCRPATH'task4_1.tmp'
#echo "CURPATH: $CURPATH
#SCRPATH: $SCRPATH
#OUTFILE: $OUTFILE
#TMPFILE: $TMPFILE"
