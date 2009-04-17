#!/bin/sh
# $XFree86: xc/programs/xinit/xinitrc.cpp,v 1.2 2006/01/09 15:01:14 dawes Exp $

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/usr/X11R6/lib/X11/xinit/.Xresources
sysmodmap=/usr/X11R6/lib/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f $userresources ]; then
    xrdb -merge $userresources
fi

if [ -f $usermodmap ]; then
    xmodmap $usermodmap
fi

# start some nice programs
/Library/Frameworks/UIM.framework/Versions/Current/bin/uim-xim --engine=prime &
quartz-wm &
exec urxvt
