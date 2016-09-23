#!/bin/bash
# Rss ativated for download new musics
# test n2

# data do ultimo update
$LAST_UPDATE = 

RSS_START ()
{
    rsstail \
        --newer $LAST_UPDATE
        --format
}

# validated if rsstail is installed
if [[ command_exists rsstail != 0 ]] ;then
    RSS_START
else
    echo "Please install rsstail for continue"
fi
