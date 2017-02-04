#!/bin/zsh

conky_starter() {
    for CONKY in $HOME/.config/conky/*.conky; do
        conky -q -c $CONKY &
    done
}
conky_starter || echo 'fail to execute conky files'
