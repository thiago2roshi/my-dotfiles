##
# Personal Customizations
# @thiagoroshi
##

# exibe taskWarrior in zsh start
 task

export PAGER=${PAGER:-less}

# command history control
export HISTSIZE=1000;
export SAVEHIST=$HISTSIZE;
export HISTFILESIZE=$HISTSIZE;
export HISTCONTROL=ignoredups;
export HISTIGNORE="ls:cd:cd -:pwd:exit:date:* --help";
export HISTFILE=$HOME/.zsh_history

# definindo usuario padrao
export DEFAULT_USER="thiago"

# editor padrao
export EDITOR='nvim'

# exportando path
export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games/:/usr/local/games"
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
export LANG=pt_BR.UTF-8

# PowerLevel9k configs
POWERLEVEL9K_MODE='awesome-fontconfig'
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_middle"
POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
POWERLEVEL9K_SHORTEN_DELIMITER='*'

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon context dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status history time)

# programs Variables
DIANA_SECRET_TOKEN='nV-SNuYxdrwmMWYboMvbIcidko_GMvMS'
