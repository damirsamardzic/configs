#!/bin/bash

export DISPLAY=:0
export XAUTHORITY=/home/damirs/.Xauthority
export DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus
export FEHBG=/home/damirs/.fehbg

[ -f $XAUTHORITY ] || exit 0

LOG=/dev/null
#LOG=/tmp/hotplug.log
#date >> $LOG

sync
/usr/bin/sleep 1

function connect(){
    /home/damirs/.screenlayout/laptop-monitor.sh >> $LOG 2>&1
}

function disconnect(){
    /home/damirs/.screenlayout/laptop-only.sh >> $LOG 2>&1 
}

if [ -n "$DISPLAY" ]; then
xrandr | grep "HDMI1 connected" &> /dev/null && connect || disconnect
[ -f $FEHBG ] && $FEHBG
fi

xrandr --listmonitors > /dev/null 2<&1 || true

exit 0

