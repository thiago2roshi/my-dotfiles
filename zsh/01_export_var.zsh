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

# definindo PROMPT da direita -- eu acho
export RPROMPT='$(date "+%T")'

# exibe taskWarrior in zsh start
 task 