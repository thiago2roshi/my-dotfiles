##
# Personal Customizations
# @thiagoroshi
##

# exibe taskWarrior in zsh start
# task

export PAGER=${PAGER:-less}

# definindo usuario padrao
export DEFAULT_USER="thiago"

# editor padrao
export EDITOR='nvim'
export VISUAL='vim'

# exportando path
export PATH="$HOME/.dotfiles/scripts:/usr/local/sbin:/usr/local/bin :/usr/sbin:/usr/bin:/sbin:/bin:/usr/games/:/usr/local/games:$PATH"
export MANPATH="/usr/local/man:$MANPATH"

# definindo PROMPT da direita -- eu acho
#export RPROMPT='$(date "+%T")'

# definindo terminal com 256 cores
export TERM="xterm-256color"

# better yaourt colors
export YAOURT_COLORS="nb=1:pkg=1:ver=1;32:lver=1;45:installed=1;42:grp=1;34:od=1;41;5:votes=1;44:dsc=0:other=1;35"

# Less need some color to?
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

# LANG env
export LC_COLLATE=pt_BR.UTF-8
export LC_CTYPE=pt_BR.UTF-8
export LC_MESSAGES=pt_BR.UTF-8
export LC_MONETARY=pt_BR.UTF-8
export LC_NUMERIC=pt_BR.UTF-8
export LC_TIME=pt_BR.UTF-8
export LANG=pt_BR.UTF-8
export LANGUAGE=pt_BR.UTF-8
export LESSCHARSET=utf-8
export LC_ALL=
