#!/bin/sh
##
# programas para rodar no pos-boot do sistema

# sxhkd : keybinds 
[[ -z $(pgrep -xU $UID sxhkd)       ]] && sxhkd &

# subindo mpd
[[ -z $(pgrep -xU $UID mpd )        ]] && mpd ~/.config/mpd/mpd.conf && sleep 1 && mpd play
[[ -z $(pgrep -xU $UID mpdscribble) ]] && mpdscribble 

# subindo conky
[[ -z $(pgrep -xU $UID conky)       ]] && source $HOME/.dotfiles/scripts/conky.sh || echo "fail to load conky_starter"

# validate network on
#sudo dhcpcd wlp0s18f2u4 

