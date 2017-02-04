#!/bin/sh
##
# programas para rodar no pos-boot do sistema

# merge Xresources
xrdb -merge ~/.Xresources &

# sxhkd : keybinds 
sxhkd &

# subindo mpd
[[ -z $(pgrep -xU $UID mpd )        ]] && mpd ~/.config/mpd/mpd.conf &
sleep 2s && mpd play &
#[[ -z $(pgrep -xU $UID mpdscribble) ]] && mpdscribble 
#[[ -z $(pgrep -xU $UID mopidy) ]] && mopidy

# Start Thunar daemon
[[ -z $(pgrep -xU $UID thunar )     ]] && thunar --daemon &

#Up WiFi
netctl start wlp0s18f2u4-Rs && sleep 1s

# subindo conky
sleep 10s
[[ -z $(pgrep -xU $UID conky)       ]] && source $HOME/.dotfiles/scripts/conky.sh || echo "fail to load conky_starter"

# validate network on
#sudo dhcpcd wlp0s18f2u3 

