#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

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
    /usr/bin/xmodmap /home/nagi/.Xmodmap 
  fi
}

Noppoo_detect
if [ $? -eq 0 ] # Noppoo detected
then
  Map_keys
fi

# exec gnome-session
# exec startkde
# exec startxfce4
# ...or the Window Manager of your choice
#case $1 in
#  xmonad)
#    exec xmonad
#    ;;
#  xfce4)
#    exec startxfce4
#    ;;
#esac
exec startxfce4

exit 0
