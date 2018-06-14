#!/bin/zsh

# conky_starter() {
#    for CONKY in $HOME/.config/conky/*.conky; do
#        conky -q -c $CONKY &
#    done
#}
# conky_starter || echo 'fail to execute conky files'
sleep 3s && (conky -q -c $HOME/.dotfiles/config/conky/conky.conf || echo 'CONKY: Fail to Execute conky'> /tmp/beebop.fifo)
