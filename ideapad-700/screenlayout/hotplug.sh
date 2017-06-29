#!/bin/bash

export DISPLAY=:0
export XAUTHORITY=/home/damirs/.Xauthority
export DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus

LOG=/tmp/hotplug.log
#LOG=/dev/null

/usr/bin/sleep 2

/bin/date 2>&1 >> $LOG

#if [[ $(cat /sys/class/drm/card0-HDMI-A-1/status | grep -Ec "^connected") -eq 1 ]]; then
#        echo "HDMI connected!" >> $LOG
#        /usr/bin/sleep 1
#        /home/damirs/.screenlayout/laptop-monitor.sh >> $LOG 2>&1
#else
#        echo "HDMI disconnected!" >> $LOG
#        /home/damirs/.screenlayout/laptop-only.sh >> $LOG 2>&1
#fi

function connect(){
    /home/damirs/.screenlayout/laptop-monitor.sh >> $LOG 2>&1
}

function disconnect(){
    /home/damirs/.screenlayout/laptop-only.sh >> $LOG 2>&1 
}


xrandr | grep "HDMI-1 connected" &> /dev/null && connect || disconnect

