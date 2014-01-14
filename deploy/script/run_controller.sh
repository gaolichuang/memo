#!/bin/bash

usage="usage: run_controller.sh (status) "

if [ $# -lt 1 ]; then
  echo $usage
  exit -1
fi

operation=$1
param="$2"
status_check() {
if [ -f /etc/apt/sources.list.d/cloudarchive-havana.list ];then
  echo -e "Havana Version: $_OK"
else
  echo -e "Havana Version: $_ERR"
fi
##intel or amd
lscpu|grep "Vendor ID" |grep "GenuineIntel" > /dev/null 2>&1
if [ $? -eq 0 ];then
  vendor=intel
  vt=vmx
  mod=kvm_intel
  echo "X86 Platform: Intel"
else
  vendor=intel
  vt=svm
  mod=kvm_amd
echo "X86 Platform: AMD"
fi
## support vt or not?
cat /proc/cpuinfo |grep "$vt" > /dev/null 2>&1
if [ $? -eq 0 ];then
  echo -e "Support VT($vendor): $_OK"
else
  echo -e "Support VT($vendor): $_ERR"
  cat /proc/cpuinfo |grep "$vt"
fi
## load kvm module or not
lsmod|grep $mod > /dev/null 2>&1
if [ $? -eq 0 ];then
  echo -e "Load Kvm Module($vendor): $_OK"
else
  echo -e "Load Kvm Module($vendor): $_ERR"
  lsmod|grep $mod
fi
### kvm-ok
kvm-ok
### virsh version
virsh version
### set secret key or not
virsh secret-list
}
ceph_secertkey_reset() {
 echo 
}
if [ $operation == "status" ];then
  status_check
#elif [ $operation == "binary_rollback" ];then
#  control_binary_rollback
fi
