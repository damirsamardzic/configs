#!/bin/bash

export DISPLAY=:0
export XAUTHORITY=/home/damirs/.Xauthority
LOG=/var/log/hotplugtv.log
#LOG=/dev/null

/bin/date 2>&1 >> $LOG
if [[ $(cat /sys/class/drm/card0-HDMI-A-1/status | grep -Ec "^connected") -eq 1 ]]; then
        echo "HDMI connected!" >> $LOG
        /usr/bin/sleep 3
        /home/damirs/.screenlayout/laptop-monitor.sh > $LOG 2>&1
else
        echo "HDMI disconnected!" >> $LOG
        /usr/bin/sleep 1
        /home/damirs/.screenlayout/laptop-only.sh > $LOG 2>&1
fi

