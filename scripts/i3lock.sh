#!/bin/bash
# i3lock in gnome
# tranks to reddit /u/freetux

ICON=$HOME/Imagens/Lock-icon.png
TMPBG=/tmp/screen.png
scrot /tmp/screen.png
convert $TMPBG -scale 10% -scale 1000% $TMPBG
convert $TMPBG $ICON -gravity center -composite -matte $TMPBG
i3lock -n -i $TMPBG -c 000000
