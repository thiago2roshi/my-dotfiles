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

wallpaper=/tmp/wallpaper_ambience/wallpaper
converted=$wallpaper
vol=$(query_vol)

# create the file path
mute=false
if [[ $(query_mute) == true ]]; then
	converted=$converted"_mute"
	mute=true
else
	converted=$converted"_"$vol
fi

vpn=false
if [[ -n $(pgrep openvpn) ]]; then
	converted=$converted"_vpn"
	vpn=true
fi

# create the file, if it isn't cached
if [[ ! -f $converted ]]; then
	if [[ $mute == true ]]; then
		convert $wallpaper -fill navyblue -colorize 60 $converted
		convert $converted -fill black -colorize 50 $converted
	else
		convert $wallpaper -fill blue -colorize $(((100 - vol) / 2)) $converted
		convert $converted -fill black -colorize $(((100 - vol) / 2)) $converted
	fi

	if [[ $vpn == false ]]; then
		convert $converted -fill red -colorize 50 $converted
	fi

fi

feh --bg-scale $converted