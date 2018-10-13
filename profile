
# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# set PATH so it includes user's private bin if it exists
if [[ $UID -ge 1000 && -d "$HOME/bin" && -z $(echo $PATH | grep -o $HOME/bin)  ]] ; then
    export PATH="${PATH}:${HOME}/bin"
fi
# set 256 colora
if [ -e /usr/share/terminfo/x/xterm-256color ]; then
    export TERM='xterm-256color'
else
    export TERM='xterm-color'
fi

# XDG variables
export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_CACHE_HOME="${HOME}/.cache"
export XDG_DATA_HOME="${HOME}/.local/share"
export BIN_HOME="$HOME/bin"

# Respect XDG config
export VIMINIT=":source $XDG_CONFIG_HOME/vim/vimrc"
export WGETRC="$XDG_CONFIG_HOME/wgetrc"
export WINEPREFIX="$XDG_DATA_HOME"/wineprefixes/default
export XAUTHORITY="$XDG_RUNTIME_DIR"/Xauthority
export LESSHISTFILE="${XDG_CONFIG_HOME}/less/history"
export LESSKEY="${XDG_CONFIG_HOME}/less/keys"

# Anothers Variables
export MANPATH="/usr/local/man:$MANPATH"
export PAGER=${PAGER:-less}
export DEFAULT_USER="thiago"
export EDITOR='vim'
export VISUAL='vim'
export SUDO_EDITOR='vim'

# PASS-TOMB
export PASSWORD_STORE_TOMB="/usr/local/bin/tomb"
export PASSWORD_STORE_TOMB_FILE="$HOME/.pass/pass.tomb"
export PASSWORD_STORE_TOMB_KEY="$HOME/.pass/pass.key.tomb"
export PASSWORD_STORE_TOMB_SIZE="20" # size in MB

# Start Xorg -> normaly 'exec startxfce4'
if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
      #exec startx
      exec startxfce4
fi
