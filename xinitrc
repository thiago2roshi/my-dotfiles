#!/bin/sh
# XinitRC
# tranks Xero

# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi
# confirm merge Xdefaults/Xresources
xrdb -merge "${HOME}/.Xresources" &

# sxhkd = keybinds
sxhkd &

# XFCE without lightdm
exec startxfce4

# gnome keyring
#eval $(gnome-keyring-daemon -s --components=pkcs11,secrets,ssh,gpg) &

# up WiFi
#netctl *****

# start thunar daemon
thunar --daemon &

# up music
mpd ~/.config/mpd/mpd.conf &
(sleep 2s && mpd play) &

# better lockscreen symlink
slock&
