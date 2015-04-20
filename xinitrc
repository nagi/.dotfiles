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

Map_noppoo () {
  if [ -f /home/nagi/.Xmodmap.noppoo ]
  then
    /usr/bin/xmodmap /home/nagi/.Xmodmap.noppoo
  fi
}

Map_compaq () {
  if [ -f /home/nagi/.Xmodmap.compaq ]
  then
    /usr/bin/xmodmap /home/nagi/.Xmodmap.compaq
  fi
}

Map_keys () {
  Noppoo_detect
  if [ $? -eq 0 ] # Noppoo detected
  then
    Map_noppoo
  else
    Map_compaq
  fi
}

Map_keys

# exec gnome-session
# exec startkde
# exec startxfce4
# ...or the Window Manager of your choice
case $1 in
  xmonad)
    exec xmonad
    ;;
  *)
    exec startxfce4
    ;;
esac

exit 0
