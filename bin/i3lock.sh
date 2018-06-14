#!/bin/bash
# i3lock in gnome
# tranks to reddit /u/freetux
# tranks to /u/edijatszik for ffmpeg hint
##
# ffmpeg is much faster (23x)

ICON=$HOME/Imagens/Lock-icon.png
TMPBG=/tmp/screen.png
RES=$(xrandr | grep 'current' | sed -E 's/.*current\s([0-9]+)\sx\s([0-9]+).*/\1x\2/')

#scrot /tmp/screen.png
#convert $TMPBG -scale 10% -scale 1000% -compress none $TMPBG
#convert $TMPBG $ICON -gravity center -composite -matte $TMPBG

ffmpeg -f x11grab -video_size $RES -y -i $DISPLAY -i $ICON -filter_complex "boxblur=5:1,overlay=(main_w-overlay_w)/2:(main_h-overlay_h)/2" -vframes 1 $TMPBG -loglevel quiet

i3lock -i $TMPBG
rm $TMPBG
