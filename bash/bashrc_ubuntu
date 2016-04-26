# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples



##================##
# funcoes -helpers #
##================##

get_dir() {
    printf "%s" $(pwd | sed "s:$HOME:~:")
}

get_sha() {
    git rev-parse --short HEAD 2>/dev/null
}


GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWSTASHSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1
# Explicitly unset color (default anyhow). Use 1 to set it.
GIT_PS1_SHOWCOLORHINTS=
GIT_PS1_DESCRIBE_STYLE="branch"
GIT_PS1_SHOWUPSTREAM="auto git"

set_prompt () {
    Last_Command=$? # Must come first!
    Blue='\[\e[01;34m\]'
    White='\[\e[01;37m\]'
    Red='\[\e[01;31m\]'
    Green='\[\e[01;32m\]'
    Reset='\[\e[00m\]'
    FancyX='\342\234\227'
    Checkmark='\342\234\223'
    # Setando titlebar
    export PROMPT_COMMAND='echo -ne "\033]0;$PWD\007"'
    # Add a bright white exit status for the last command
    PS1="$White\$? "
    # If it was successful, print a green check mark. Otherwise, print
    # a red X.
    if [[ $Last_Command == 0 ]]; then
        PS1+="$Green$Checkmark "
    else
        PS1+="$Red$FancyX "
    fi
    # If root, just print the host in red. Otherwise, print the current user
    # and host in green.
    if [[ $EUID == 0 ]]; then
        PS1+="$Red\\h "
    else
        PS1+="$Green\\u@\\h "
    fi
    # Print the working directory and prompt marker in blue, and reset
    # the text color to the default.
    #
    # Diretorio completo
    PS1+="$Blue\\W$Red\$(__git_ps1 ' [%s $(get_sha)] ')$White\\\$$Reset "
    #PS1+="$Blue\\W $White\\\$$Reset "

}
PROMPT_COMMAND='set_prompt'

##================##
# fim dos -helpers #
##================##



# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
#    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\W$(__git_ps1)\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\W$(__git_ps1)\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
#alias ll='ls -alF' # nao gosto do nativo
alias ll='ls -alFh' # o -h de para exibir "Mbs" "Gbs" ao inves de "bytes"
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

################
# MOTD Choboco #
################
# Thanks to http://blog.petrockblock.com/forums/topic/retropie-mushroom-motd/#post-3965

function welcome() {
  local upSeconds="$(/usr/bin/cut -d. -f1 /proc/uptime)"
  local secs=$((upSeconds%60))
  local mins=$((upSeconds/60%60))
  local hours=$((upSeconds/3600%24))
  local days=$((upSeconds/86400))
  local UPTIME=$(printf "%d days, %02dh%02dm%02ds" "$days" "$hours" "$mins" "$secs")

  # calculate rough CPU and GPU temperatures:
  local cpuTempC=$(sensors | grep "CPU Temp" | cut -f2 -d'+' | cut -f1 -d' ' | cut -f1 -d "C" | awk '{print substr($1,0,5)}')
  local gpuTempC=$(sensors | grep "temp1:" | cut -f2 -d'+' | cut -f1 -d' ' | cut -f1 -d "C" | awk '{print substr($1,0,5)}')


  if [[ -f "/opt/vc/bin/vcgencmd" ]]; then
      if gpuTempC=$(/opt/vc/bin/vcgencmd measure_temp); then
          gpuTempC=${gpuTempC:5:2}
      else
          gpuTempC=""
      fi
  fi

  local df_out=()
  local line
  while read line; do
    df_out+=("$line")
  done < <(df -h /)

  echo "
        ,\$$.       ,\$$.            | $(date +"%A, %e %B %Y, %r")
       ,$''$.     ,$''$.             | $(uname -srmo)
       $'  '$     $'  '$
      :$    $;   :$    $;
      \$$    \$$   \$$    \$$        | UpTime..............: ${UPTIME}
      \$$  _.\$bqgpd$._  \$$         | Memory..............: $(grep MemFree /proc/meminfo) | awk ({'print $2'})mB (Total)
      ;\$gd\$$^\$$\$$\$^$\$bg$:      | Running Process.....: $(ps ax | wc -l |tr -d " ")$
    .d\$P^*'   '*'   '*^T\$b.        | IP Address..........: $(ip route get 8.8.8.8 2>/dev/null | head -1 | cut -d' ' -f8)
   d$\$$    ,*'   '*.    \$$\$b      | Temperature.........: CPU: $cpuTemC°C GPU: $gpuTempC°C
  d\$$\$b._    o   o    _.d\$$\$b
 *T$\$$\$\$P             T$\$$\$\$P*
   '^T\$$    :'---';    $\$P^'
      '$._   '---'   _.$'
     .d$\$P'**-----**'T$\$b.
    d$\$P'             'T$\$b
   d$\$P                 T$\$b
  d\$P'.'               '.'T\$b
  '--:                   ;--'
     |                   |
     :                   ;
      \                 /
      .'-.           .-'.
     /   .'*--+g+--*'.   \\
    :   /     $\$\$     \   ;
    '--'      :$\$;     '--'
              :$\$;
               :$\$
               'T$\bg+.____
                 'T$\$$\$$  :
                     '**--'
"
}
### Invocando o MOTD
# welcome # em analise

################
# Fim do MOTD ##
################
