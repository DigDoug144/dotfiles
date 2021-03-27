#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then







    xrdb -merge $sysresources

fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then







    xrdb -merge "$userresources"

fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

#exec startplasma-x11

nitrogen --restore &

xrandr --output DP-1 --off --output DP-2 --off --output HDMI-1 --off --output HDMI-2 --mode 1680x1050 --pos 0x195 --rotate normal --output DVI-D-1 --primary --mode 2560x1440 --pos 1680x0 --rotate normal &

redshift &

while true; do
	dwm >/dev/null 2>&1
done

exec dwm
