#!/bin/bash
# author: bronx_warrior
# https://www.reddit.com/r/unixporn/comments/3xen3g/bspwm_functional_wallpaper/

# returns value between 0 and 100.
function query_vol {
	amixer get Master | tail -1 | awk '{print $5}' | tr -d '[]' | grep -o "[0-9]*"
}

# returns true or false
function query_mute {
	if [[ $(amixer get Master | tail -1 | awk '{print $6}' | tr -d '[]') == "on" ]]; then
		echo false
	else
		echo true
	fi
}

#wallpaper=/tmp/wallpaper_ambience/wallpaper
wallpaper="$(gsettings get org.gnome.desktop.background picture-uri | sed "s/'//g" | sed "s/^.//")"
CONVERTED=$wallpaper
vol=$(query_vol)

# create the file path
mute=false
if [[ $(query_mute) == true ]]; then
	CONVERTED=$CONVERTED"_mute"
	mute=true
else
	CONVERTED=$CONVERTED"_"$vol
fi

vpn=false
#if [[ -n $(pgrep openvpn) ]]; then
#	CONVERTED=$CONVERTED"_vpn"
#	vpn=true
#fi

# create the file, if it isn't cached
if [[ ! -f $CONVERTED ]]; then
	if [[ $mute == true ]]; then
		convert $wallpaper -fill navyblue -colorize 60 $CONVERTED
		convert $CONVERTED -fill black -colorize 50 $converted
	else
		convert $wallpaper -fill blue -colorize $(((100 - vol) / 2)) $CONVERTED
		convert $CONVERTED -fill black -colorize $(((100 - vol) / 2)) $converted
	fi

	if [[ $vpn == false ]]; then
		convert $CONVERTED -fill red -colorize 50 $converted
	fi

fi

#feh --bg-scale $CONVERTED
gsettings set org.gnome.desktop.background picture-uri $CONVERTED
