##
# Personal Customizations
# @thiagoroshi
##

# neovim > vim
 export EDITOR="nvim"

# command history control
 export HISTSIZE=1000;
 export HISTFILESIZE=$HISTSIZE;
 export HISTCONTROL=ignoredups;
 export HISTIGNORE="ls:cd:cd -:pwd:exit:date:* --help";

# definindo usuario padrao
export DEFAULT_USER="thiago"

# exportando path
export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games/:/usr/local/games"
export MANPATH="/usr/local/man:$MANPATH"
 
# definindo PROMPT da direita -- eu acho
#export RPROMPT='$(date "+%T")'

# pretty yaourt
export YAOURT_COLORS="nb=1:pkg=1:ver=1;32:lver=1;45:installed=1;42:grp=1;34:od=1;41;5:votes=1;44:dsc=0:other=1;35"

# definindo terminal com 256 cores
export TERM="xterm-256color"

# exibe taskWarrior in zsh start
 task 

# LANG env
export LANG=pt_BR.UTF-8


