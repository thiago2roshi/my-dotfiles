#!/bin/sh
# detect process close 
# use: anywhere 0000 (PID number)
# https://stackoverflow.com/questions/1058047/wait-for-any-process-to-finish
#
anywhere_wait () {
    local PID_SLOW=$@
    while kill -0 $PID_SLOW 2> /dev/null;do
        sleep 1
    done
    return 0
}
anywhere_wait
