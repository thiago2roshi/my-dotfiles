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
    inc_append_history   \
    hist_ignore_all_dups \
    hist_reduce_blanks   \
    hist_save_no_dups    \
    hist_ignore_space    \
    hist_verify          \
    extended_history     \
    share_history

