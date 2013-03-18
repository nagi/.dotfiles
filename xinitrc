#!/bin/sh

# DELL
# xrandr --output DFP10 --primary
# SAMSUNG
# xrandr --output DFP11 --primary

Noppoo_detect () {
  NOPPOO_KEYBOARD_DEV_ID=1006:0022
  lsusb | grep -q $NOPPOO_KEYBOARD_DEV_ID
}

Map_keys () {
  if [ -f /home/nagi/.Xmodmap ] 
  then
    /usr/bin/xmodmap .Xmodmap 
  fi
}

Noppoo_detect
if [ $? -eq 0 ] # Noppoo detected
then
  Map_keys
fi

exit 0

