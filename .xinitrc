#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps
#xset +fp /usr/share/fonts/TTF
#xset +fp /usr/share/fonts/OTF

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

if [[ -f /usr/bin/prime-offload ]]; then
    /usr/bin/prime-offload
fi

xrdb .Xresources

xrandr --output DP-1 --rotate left
bash ~/.screenlayout/screenlayout.sh

i3 &
#xclock -geometry 50x50-1+1 &
#xterm -geometry 80x50+494+51 &
#xterm -geometry 80x20+494-0 &
#exec xterm -geometry 80x66+0+0 -name login
exec unclutter -idle 0.1 -root &
exec brave

if [[ -f /usr/bin/prime-switch ]]; then
    /usr/bin/prime-switch
fi
