#!/bin/sh
##
# programas para rodar no pos-boot do sistema
# subindo mpd
killall mpd ;  mpd ~/.config/mpd/mpd.conf
mpd play
# subindo conky
conky -d -c /home/thiago/.config/conky/conky.conf
# albert -> hotkey <Ctrl>+<space>
#albert
# redshift -> coloração da tela
#redshift
# espaco para o irei adicionar depois
