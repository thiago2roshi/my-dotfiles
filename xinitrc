#!/bin/sh
# XinitRC
# tranks Xero

# confirm merge Xdefaults/Xresources
xrdb -merge "${HOME}/.Xresources" &

# gnome keyring
#eval $(gnome-keyring-daemon -s --components=pkcs11,secrets,ssh,gpg) &

# sxhkd = keybinds
sxhkd &

# up WiFi
#netctl *****

# start thunar daemon
thunar --daemon &

# up music
mpd ~/.config/mpd/mpd.conf &
(sleep 2s && mpd play) &

# better lockscreen symlink
slock&
