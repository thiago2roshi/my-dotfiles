##
# Personal Customizations
# @thiagoroshi
##

# zsh history configs

# command history control
export HISTFILE=$HOME/.zsh_history
export HISTSIZE=100000
export SAVEHIST=$HISTSIZE
export HISTFILESIZE=$HISTSIZE
export HISTIGNORE="ls::pwd:exit:date:* --help"

setopt \
    append_history       \
    hist_ignore_all_dups \
    hist_ignore_space    \
    inc_append_history   \
    hist_verify          \
    EXTENDED_HISTORY     \
    SHARE_HISTORY        

