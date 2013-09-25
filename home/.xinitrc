#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# configure the keyboard
setxkbmap -rules evdev -model evdev -layout us -variant intl

# configure keyboard shortcuts (see .xbindkeysrc)
xbindkeys

# exec gnome-session
# exec startkde
# exec startxfce4
# ...or the Window Manager of your choice
exec i3
