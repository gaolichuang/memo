#!/bin/bash

SHELL_NAME=news_petabyte_handler.sh
HOST_LIST=conf/nova-compute.host
CONTROLLER=script/run_controller.sh
CONTROLLER_CMD=run_controller.sh
USER=cloud
PASS_WORD=XXXXXX
D_USER=root

usage()
{
  echo "Usage: $SHELL_NAME [start|stop|clearlog|check_bin|check_mem|check_disk|status] [ntp|nova-compute|nova-compute-all|nova-scheduler|nova-api]"
  echo "Usage: $SHELL_NAME [check_bin|check_mem|check_disk|status]"
  exit
}

if [ $# -lt 1 ]; then
  usage
  exit
fi

if [ "$1" = "restart" -o "$1" = "stop" -o "$1" = "start" ]; then
  if [ "$2" = "X" ];then
    usage
    exit
  fi
  if [ "$2" = "nova-api" -a "$1" = "stop" ];then
    multiexec -f $HOST_LIST -u $USER "echo $PASS_WORD|sudo -S date; sudo -u $D_USER killall $2"
  elif [ "$2" = "nova-compute-all" ];then
    multiexec -f $HOST_LIST -u $USER "echo $PASS_WORD|sudo -S date; sudo -u $D_USER service libvirtd $1"
    multiexec -f $HOST_LIST -u $USER "echo $PASS_WORD|sudo -S date; sudo -u $D_USER service openvswitch-switch $1"
    multiexec -f $HOST_LIST -u $USER "echo $PASS_WORD|sudo -S date; sudo -u $D_USER service neutron-plugin-openvswitch-agent $1"
    multiexec -f $HOST_LIST -u $USER "echo $PASS_WORD|sudo -S date; sudo -u $D_USER service nova-compute $1"
  else
    multiexec -f $HOST_LIST -u $USER "echo $PASS_WORD|sudo -S date; sudo -u $D_USER service $2 $1"
  fi
elif [ "$1" = "clearlog" ]; then
  if [ "$2" = "nova-controller" ];then
    multiexec -f $HOST_LIST -u $USER "echo $PASS_WORD|sudo -S date; sudo -u nova  for $f in `ls /var/log/nova/*.log` ;do cat /dev/null > $f ;done"
  else
    multiexec -f $HOST_LIST -u $USER "echo $PASS_WORD|sudo -S date; sudo -u nova cat /dev/null > /var/log/nova/$2.log"
  fi
elif [ "$1" = "status" ]; then
  multiexec -f $HOST_LIST -u $USER "rm /tmp/$CONTROLLER_CMD"
  multicp -f $HOST_LIST -u $USER -r $CONTROLLER /tmp
  multiexec -f $HOST_LIST -u $USER "echo $PASS_WORD|sudo -S date; sudo -u $D_USER bash /tmp/$CONTROLLER_CMD status"
elif [ "$1" = "check_bin" ]; then
  multiexec -f $HOST_LIST -u $USER "ps aux|grep $2 |grep -v grep"
elif [ "$1" = "check_mem" ]; then
  multiexec -f $HOST_LIST -u $USER "free -m"
elif [ "$1" = "check_disk" ]; then
  multiexec -f $HOST_LIST -u $USER "df -h"
elif [ "$1" = "uptime" ]; then
  multiexec -f $HOST_LIST -u $USER "uptime"
elif [ "$1" = "uname" ]; then
  multiexec -f $HOST_LIST -u $USER "uname -a"

else
  usage
fi
