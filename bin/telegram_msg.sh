#!/bin/bash
######
###
# telegram-cli bash script r0.1
# change 'to' to your own  Telegram account name
# by =  Mohammad Hafiz bin Ismail  [mypapit@gmail.com]
# url=  https://blog.mypapit.net/
###
######

show_usage() {
    echo "Usage $0 [message]"
    return 1
    exit
}

## Replace 'to' with your account name
to=Thiagoroshi
if [ $# -lt 1 ]
then
    show_usage
fi

telegram-cli -W -e "msg $to $1"
