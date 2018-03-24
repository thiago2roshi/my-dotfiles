################
# some more helpers aliases
################

#█▓▒░ av aliases
# Thanks Xero... again
alias sec-rootkits-check="sudo rkhunter --update; sudo rkhunter --propupd; sudo rkhunter --check"
alias sec-av-check="clamscan --recursive=yes --infected /home"
alias sec-av-update="sudo freshclam"

# ls aliases
# using space in command for ignoring in history
alias ls=' ls --tabsize=0 --literal --color=auto --show-control-chars --classify --human-readable --group-directories-first -X'
alias la='ls -A'
alias l='\ls -C'
alias ll='ls -alh'

# Colorize Everything
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Expand commands
alias less='less -r'
alias more='less'
alias free='free -m'                          # size in MB
alias man='man -a'                            # display all manpages
alias mv='mv -iv'
alias cp="cp -i"                              # confirm before overwriting something
alias rm='echo "use rmi for no timeout cmd";noglob timeout 3 rm -Iv --one-file-system' # limit potencial damage
alias rmi='noglob \rm -Iv --one-file-system'  # securiry reasons
alias df='df -h'                              # human readable
alias du='du -h'                              # human readable to
alias cls='clear'
alias mkdir='mkdir -p -v'
alias dmesg='dmesg --color=always'
alias feh='\feh -q -N -x --scale-down'        # quiet, borderless, no-menus, montage mode
# utils commands
alias reload-zsh='source ~/.zshrc ; clear'
alias help=run-help                           # active helper in zsh
alias 'jobs'='jobs -l || echo "no running jobs"'
alias aur-update='yaourt -Syu --aur'
alias hwinfo-cpu='grep "model name" /proc/cpuinfo'
alias decoder_effect='$1 | nms -a'
alias myip='dig TXT +short o-o.myaddr.l.google.com |sed "s/\"//g"'
alias fuzzy-search='fzf'
alias duplicate_finder="/usr/bin/ls **/* -1 | tr '[A-Z]' '[a-z]' | sort | uniq -c | grep -v ' 1 '"

# print 146 newer commands in order of more use
alias cmd-newer='fc -li -146 | awk '{print $4}' | sort | uniq -c'

# Calendary in terminal
alias calendary='cal'

# Global aliases dropped for using VIM Abreviations "plugin"
#alias -g ':L'='| color-less'
#alias -g ':G'='| grep'

# Aria2 its so cool, but need a work
alias download='aria2c --conf-path=$HOME/.config/aria2/aria2.conf'

# cd it's for dummies
alias ...='../..'
alias ....='../../..'
alias .....='../../../..'
alias ~='cd ~'

# I dont need remember filetype-program
# USE-> # "file.txt" equals # "nvim file.txt"
alias -s mkv="mpv"
alias -s html="w3m"
alias -s txt='vim'
alias -s md='mdless'

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
#alias mutt='mutt -F ~/.config/mutt/muttrc'
alias docker='sudo docker'
alias zeroNet='docker run -d -e "ENABLE_TOR=true" -v /tmp/zeroNet:/root/data -p 15441:15441 -p 127.0.0.1:43110:43110 nofish/zeronet'

## Simple pacman aliases
# from gist.github.com/netzverweigerer/0b3670e9b5e30cb71710
alias pacman-upgrade="pacman -Syu"                 # Synchronize with repositories and then upgrade packages that are out of date on the local system.
alias pacman-download="pacman -Sw"                 # Download specified package(s) as .tar.xz ball
alias pacman-install="pacman -S"                   # Install specific package(s) from the repositories
alias pacman-install-file="pacman -U"              # Install specific package not from the repositories but from a file
alias pacman-remove="pacman -R"                    # Remove the specified package(s), retaining its configuration(s) and required dependencies
alias pacman-purge="pacman -Rns"                   # Remove the specified package(s), its configuration(s) and unneeded dependencies
alias pacman-repoinfo="pacman -Si"                 # Display information about a given package in the repositories
alias pacman-search="pacman -Ss"                   # Search for package(s) in the repositories
alias pacman-dbinfo="pacman -Qi"                   # Display information about a given package in the local database
alias pacman-dbsearch="pacman -Qs"                 # Search for package(s) in the local database
alias pacman-list-orphaned="pacman -Qdt"           # List all packages which are orphaned
alias pacman-clean-cache="pacman -Scc"             # Clean cache - delete all the package files in the cache
alias pacman-list-package-files="pacman -Ql"       # List all files installed by a given package
alias pacman-provides-="pacman -Qo"                # Show package(s) owning the specified file(s)
alias pacman-force-installed="pacman -D --asexp"   # Mark one or more installed packages as explicitly installed
alias pacman-force-uninstalled="pacman -D --asdep" # Mark one or more installed packages as non explicitly installed
alias pacman-aur-list="pacman -Qm"                 # list aur/external packages installed

# other aliases
alias disks='echo "╓───── m o u n t . p o i n t s"; echo "╙────────────────────────────────────── ─ ─ "; lsblk -a; echo ""; echo "╓───── d i s k . u s a g e"; echo "╙────────────────────────────────────── ─ ─ "; df;' # cool echo df:
#alias st='st -t "Suckless Terminal NOTO MONO" -f "Noto Mono:style=Semibold:size=10" -g "130x28"'
