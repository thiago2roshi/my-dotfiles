#!/usr/bin/env zsh

# This script prints a bell character when a command finishes
# if it has been running for longer than $zbell_duration seconds.
# If there are programs that you know run long that you don't
# want to bell after, then add them to $zbell_ignore.
#
# This script uses only zsh builtins so its fast, there's no needless
# forking, and its only dependency is zsh and its standard modules
#
# Written by Jean-Philippe Ouellet <jpo@vt.edu>
# Made available under the ISC license.

# only do this if we're in an interactive shell
[[ -o interactive ]] || return

# get $EPOCHSECONDS. builtins are faster than date(1)
zmodload zsh/datetime || return

# make sure we can register hooks
autoload -Uz add-zsh-hook || return

# initialize zbell_duration if not set
(( ${+zbell_duration} )) || zbell_duration=60
(( ${+zbell_duration_long} )) || zbell_duration_long=180

# initialize zbell_ignore if not set
(( ${+zbell_ignore} )) || zbell_ignore=($EDITOR $PAGER ls watch htop top ssh iotop dstat vmstat nano emacs vi vim nvim bwm-ng less more fdisk audacious play aplay sqlite3 wine mtr ping traceroute vlc mplayer ncmpcpp mpd mpv conky smplayer tail tmux screen man sawfish-config powertop g man run-help ranger w3m 'wifi.sh' 'wifi-menu')

# initialize it because otherwise we compare a date and an empty string
# the first time we see the prompt. it's fine to have lastcmd empty on the
# initial run because it evaluates to an empty string, and splitting an
# empty string just results in an empty array.
zbell_timestamp=$EPOCHSECONDS

# right before we begin to execute something, store the time it started at
zbell_begin() {
	zbell_timestamp=$EPOCHSECONDS
	zbell_lastcmd=$1
}

zbell_noise() {
    local message="ZSH_NOTIFY - $HOST
    Command: $zbell_lastcmd completed
    exit status: $zbell_exit_status
    Time: $(pretty_time $zbell_cmd_duration)"
    
    mpv \
      --no-audio-display \
      --really-quiet \
      $HOME/Downloads/nintendoSwitchSound.mp3 

    echo $message > /tmp/beepop.fifo
    echo $message > /tmp/telegram_msg
}

zbell_email() {
  curl --ssl-reqd \
    --url "smtps://mail.patshead.com:465" \
    --mail-from "zbell@patshead.com" \
    --mail-rcpt "zbell@patshead.com" \
    --user 'zbell@patshead.com:password' \
    --insecure --upload-file - &> /dev/null <<EOF &|
From: "ZSH Notification" <zbell@patshead.com>
To: "Pat Regan" <thehead@patshead.com>
Subject: $HOST - $zbell_lastcmd

Completed with exit status $zbell_exit_status

EOF
}


zbell_external_notify() {
    if [[ -e $HOME/bin/telegram_msg.sh ]];then
        telegram-cli -W -e "send_text Thiagoroshi /tmp/telegram_msg"
    else
        zbell_email
    fi
}


# when it finishes, if it's been running longer than $zbell_duration,
# and we dont have an ignored command in the line, then print a bell.
zbell_end() {
  zbell_exit_status=$?
	ran_long=$(( $EPOCHSECONDS - $zbell_timestamp >= $zbell_duration ))

	local has_ignored_cmd=0
  local zbell_lastcmd_tmp
  zbell_lastcmd_tmp="$zbell_lastcmd"
#  regexp-replace zbell_lastcmd_tmp '^sudo ' ''

  if [[ $zbell_last_timestamp == $zbell_timestamp ]]; then
    return
  fi
  
  if [[ $zbell_lastcmd_tmp == "" ]]; then
    return;
  fi

  zbell_last_timestamp=$zbell_timestamp
  
	for cmd in ${(s:;:)zbell_lastcmd_tmp//|/;}; do
		words=(${(z)cmd})
		util=${words[1]}
		if (( ${zbell_ignore[(i)$util]} <= ${#zbell_ignore} )); then
			has_ignored_cmd=1
			break
		fi
	done

	if (( ! $has_ignored_cmd )) && (( ran_long )); then
        local zbell_cmd_duration
        zbell_cmd_duration=$(( $EPOCHSECONDS - $zbell_timestamp ))

        if [[ $zbell_cmd_duration -gt $zbell_duration_long ]]; then
            zbell_noise
            #zbell_external_notify
        else
            zbell_noise
        fi

        notify-send -t 5000 \
            "Job completed on $HOST:" \
            "Command ** $zbell_lastcmd completed **
        exit status: $zbell_exit_status 
        Time: $(pretty_time $zbell_cmd_duration)"
    fi
}

# register the functions as hooks
add-zsh-hook preexec zbell_begin
add-zsh-hook precmd zbell_end
