##
# Personal Customizations
# @thiagoroshi
##

# not view username in PS1 while 
# logged in default user
 DEFAULT_USER="thiago"

# neovim > vim
 export EDITOR="nvim"

# command history control
 export HISTSIZE=1000;
 export HISTFILESIZE=$HISTSIZE;
 export HISTCONTROL=ignoredups;
 export HISTIGNORE="ls:cd:cd -:pwd:exit:date:* --help";
 
# Remeber me active works
 task

# bora ver o que roda embaixo do capô?
# screenfetch

# Customizing PowerLevel9K theme

#POWERLEVEL9K_MODE='compatible'  
# modes=(awesome-fontconfig, awesome-patched, compatible, flat)
POWERLEVEL9K_SHORTEN_DIR_LENGTH=3
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"
POWERLEVEL9K_SHORTEN_DELIMITER=""
POWERLEVEL9K_STATUS_VERBOSE=false
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir status)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(vcs time)
POWERLEVEL9K_SHOW_CHANGESET=true
POWERLEVEL9K_CHANGESET_HASH_LENGTH=6
