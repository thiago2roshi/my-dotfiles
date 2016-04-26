################
# some more helpers aliases
################

# ls aliases
alias ls='ls --tabsize=0 --literal --color=auto --show-control-chars --human-readable --group-directories-first -X'
alias la='ls -A'
alias l='ls -CF'
alias ll='ls -alFh'

# utils commands
alias less='less -r'
alias more='less'
alias free='free -m'     # size in MB
alias cp="cp -i"         # confirm before overwriting something
alias df='df -h'         # human readable
alias du='du -h -d 2'    # human readable to
alias clr='clear'        
alias mkdir='mkdir -p'
alias reload='source ~/.zshrc'
alias -g xL='| less'     # global alias "<command> xL" equals a "<command> | less"
alias -g xS='| sort -n'  # same thing upper

# cd it's for dummies
alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'

# Colorize Everything
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# git needs aliases?
alias ga='git add'
alias gst='git status'
alias gc='git commit -v'
alias gp='git push'
alias gl='git pull'
alias gr='git remote'
alias gra='git remote add'
alias gd='git diff'
alias gdw='git diff --word-diff'
alias ghist='git log --graph --full-history --all --color --pretty=tformat:"%x1b[31m%h%x09%x1b[32m%d%x1b[0m%x20%s%x20%x1b[33m(%an)%x1b[0m"'

# gsync aliases
alias rsync-copy="rsync -avz --progress -h"
alias rsync-move="rsync -avz --progress -h --remove-source-files"
alias rsync-update="rsync -avzu --progress -h"
alias rsync-synchronize="rsync -avzu --delete --progress -h"
# applications aliases
alias mutt='mutt -F ~/.config/mutt/muttrc'
alias clima='curl http://wttr.in/SaoPaulo'
alias docker='sudo docker'
