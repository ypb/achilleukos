#!/bin/sh

# helper script designed to run achilles from source directory
# with some DEFault values while teeing output to a $LOGNAME logfile
# but it should also work if placed in the same directory as achilles binary

PROGNAME=achilles
NAME=`basename $0`
WHERE=`dirname $0`
BIN=`test -f ${WHERE}/${PROGNAME} && echo ${WHERE}/${PROGNAME} || echo ${WHERE}/../${PROGNAME}`

DEFX=16
DEFZ=16
DEFF=10
DEFC=10

LOGDIR=$HOME/.$PROGNAME/log

mkdir -p $LOGDIR || exit 1

LOGNAME=$LOGDIR/`date +%y%m%d-%H%M%S`

echo "${NAME}: using logfile(${LOGNAME})"

COMMAND="$BIN -x $DEFX -z $DEFZ -f $DEFF $DEFC"

echo "${NAME}: $COMMAND" > $LOGNAME

$COMMAND 2>&1 | tee -a $LOGNAME

