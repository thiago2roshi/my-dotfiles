#!/bin/sh
##
# programas para rodar no pos-boot do sistema

# merge Xresources
xrdb -merge ~/.Xresources

# Lemonbar and notification things
# use: output message in /tmp/beepop.fifo and /tmp/popup.fifo
beepop & 
#popup-overlay.sh &

# sxhkd : keybinds 
[[ -z $(pgrep -xU $UID sxhkd)       ]] && sxhkd &

# subindo mpd
[[ -z $(pgrep -xU $UID mpd )        ]] && mpd ~/.config/mpd/mpd.conf &
sleep 2s && mpd play 
#[[ -z $(pgrep -xU $UID mpdscribble) ]] && mpdscribble 
#[[ -z $(pgrep -xU $UID mopidy) ]] && mopidy

# Start Thunar daemon
[[ -z $(pgrep -xU $UID thunar )     ]] && thunar --daemon &

#Up WiFi
#netctl start enp0s18f2u4-RS_G && sleep 1s
#pkexec wifi.sh connect RS_G "1597rafael" &
#sleep 2s
# subindo conky
#[[ -z $(pgrep -xU $UID conky)       ]] && conky.sh &

# wpa_cli notification
wpa_cli -a ~/bin/wpa_notify.sh
