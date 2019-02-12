#!/bin/sh
i3status | (read line && echo "$line" && read line && echo "$line" && read line && echo "$line" && while :
do
    read line
  	lcdstat="$(( $(cat /sys/class/backlight/intel_backlight/actual_brightness ) * 100 / $(cat /sys/class/backlight/intel_backlight/max_brightness) ))%"
    echo ",[{\"name\":\"lcd\",\"markup\":\"none\",\"full_text\":\"LCD: $lcdstat\"},${line#,\[}" || exit 1
done)
