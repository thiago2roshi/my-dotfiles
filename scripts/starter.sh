#!/bin/sh
##
# programas para rodar no pos-boot do sistema

# merge Xresources
xrdb -merge ~/.Xresources &

# sxhkd : keybinds 
sxhkd &

# Lemonbar and notification things
# use: output message in /tmp/beepop.fifo and /tmp/popup.fifo
beebop & 
popup-overlay &

# subindo mpd
[[ -z $(pgrep -xU $UID mpd )        ]] && mpd ~/.config/mpd/mpd.conf &
sleep 2s && mpd play &
#[[ -z $(pgrep -xU $UID mpdscribble) ]] && mpdscribble 
#[[ -z $(pgrep -xU $UID mopidy) ]] && mopidy

# Start Thunar daemon
[[ -z $(pgrep -xU $UID thunar )     ]] && thunar --daemon &

#Up WiFi
#netctl start enp0s18f2u4-RS_G && sleep 1s
pkexec wifi.sh connect RS_G "1597rafael" && sleep 1s

# subindo conky
[[ -z $(pgrep -xU $UID conky)       ]] && conky \
            -q -c $HOME/.dotfiles/config/conky/conky.conf &
