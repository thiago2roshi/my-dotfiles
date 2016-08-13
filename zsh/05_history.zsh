##
# Personal Customizations
# @thiagoroshi
##

# zsh history configs

# command history control
export HISTFILE=$HOME/.zsh_history
setopt APPEND_HISTORY
export HISTSIZE=1000
export SAVEHIST=1200

export HISTFILESIZE=$HISTSIZE
export HISTCONTROL=ignoredups
export HISTIGNORE="ls:cd:cd -:pwd:exit:date:* --help"
setopt HIST_EXPIRE_DUPS_FIRST
setopt EXTENDED_HISTORY
setopt SHARE_HISTORY
