################
# some more helpers aliases
################

# ls aliases
alias ls='ls --color=auto'
alias la='ls -A'
alias l='ls -CF'
alias ll='ls -alFh'
alias less='less -r'
alias df='df -h'
alias du='du -h -d 2'

# Colorize Everything
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Some utils and variables aliases
alias zshrc='$EDITOR ~/.zshrc'
alias help='man'

# git needs aliases?
alias ghist='git log --graph --full-history --all --color --pretty=tformat:"%x1b[31m%h%x09%x1b[32m%d%x1b[0m%x20%s%x20%x1b[33m(%an)%x1b[0m"'

# gsync aliases
alias rsync-copy="rsync -avz --progress -h"
alias rsync-move="rsync -avz --progress -h --remove-source-files"
alias rsync-update="rsync -avzu --progress -h"
alias rsync-synchronize="rsync -avzu --delete --progress -h"
