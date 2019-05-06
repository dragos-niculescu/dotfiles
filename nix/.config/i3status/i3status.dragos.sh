#!/bin/bash

ipext=`curl 'https://api.ipify.org'`



i3status | while :
do
    read line
    # processes that use disk
    disku=`ps aux | awk 'BEGIN{l="";} $8 ~ /D/  { l=l $11;} END{print l}'`
    # read idle time from proc stat 
    read -r cpubusy cputotal <<< $(cat /proc/stat | grep 'cpu '| awk  '{print $2+$3+$4+$6+$7+$8, $2+$3+$4+$5+$6+$7+$8}')
    load=$(echo "scale=2; ($cpubusy - $cpubusy0)/($cputotal - $cputotal0)" | bc -l)
    cpubusy0=$cpubusy
    cputotal0=$cputotal
    
    netspd=`~/.config/i3status/i3speed.sh`
    echo "$disku | $netspd $ipext | ${load} $line" || exit 1
done

