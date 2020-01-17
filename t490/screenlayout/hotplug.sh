#!/bin/bash

export USERNAME=damirs
export USERID=$(id -u $USERNAME)
export DISPLAY=:0
export XAUTHORITY=/home/$USERNAME/.Xauthority
export DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/$USERID/bus
export FEHBG=/home/$USERNAME/.fehbg

[ -f $XAUTHORITY ] || exit 0

LOG=/dev/null
LOG=/tmp/hotplug.log
date >> $LOG

LAYOUTCMD="eDP1.sh"

sync
xrandr >/dev/null 2<&1 || true
/usr/bin/sleep 2


if [ -n "$DISPLAY" ]; then
    if xrandr | grep -q "DP2-2 connected" &> /dev/null; then
        LAYOUTCMD="DP2-2__eDP1.sh";
        /home/$USERNAME/.screenlayout/$LAYOUTCMD >> $LOG 2>&1
        sleep 1
        if xrandr | grep -q "DP2-3 connected" &> /dev/null; then
            LAYOUTCMD="DP2-2__DP2-3__eDP1.sh"
        fi
    elif xrandr | grep -q "DP2-3 connected" &> /dev/null; then
        LAYOUTCMD="DP2-3__eDP1.sh"
    elif xrandr | grep -q "HDMI2 connected" &> /dev/null; then
        LAYOUTCMD="HDMI2__eDP1.sh"
    fi
    /home/$USERNAME/.screenlayout/$LAYOUTCMD >> $LOG 2>&1
    sleep 1

    [ -f $FEHBG ] && $FEHBG
fi

xrandr --listmonitors >> $LOG 2<&1 || true

exit 0
