# autocompletion system
#autoload -U ~/.dotfiles/zsh/completion/*(:t)
#autoload -U ~/.dotfiles/zsh/gen-completion/*(:t)
#autoload -U ~/.dotfiles/zsh/plugins/zsh-completions/src/*(:t)
#autoload -U /usr/share/bash-completion/bash-completion


# load completion folder
fpath+="`dirname $0`/completion"
fpath+="`dirname $0`/gen-completion"
fpath+="/usr/share/bash-completion/bash-completion"
fpath+="`dirname $0`/plugins/zsh-completions/src"   # zsh-completions plugins

# turn autocompletion on
zmodload zsh/complist
autoload -Uz compinit
autoload -Uz bashcompinit

compinit && bashcompinit

# some _compdef 
# using _gnu_generec for --help of commands if not exist a "_completion" file
compdef _gnu_generic  ip
compdef _gnu_generic  grep
compdef _gnu_generic  make
#compdef _vim          nvim
compdef nvim=vim
compdef pkill=kill
compdef pkill=killall

# ignore completion to commands we don't have
zstyle ':completion:*:functions'          ignored-patterns '_*'

# Caching files
zstyle ':completion:*'                    use-cache on
zstyle ':completion:*'   		              cache-path ~/.cache/zsh
# format autocompletion style
zstyle ':completion:*:descriptions'       format "%{$c1%}%d%{$reset_color%}"
zstyle ':completion:*:corrections'        format "%{$c3%}%d%{$reset_color%}"
zstyle ':completion:*:messages'           format "%{$c1%}%d%{$reset_color%}"
zstyle ':completion:*:warnings'           format "%{$c1%}%d%{$reset_color%}"

## VCS
# vcs_info
zstyle ':vcs_info:*'                      enable git hg svn
# check-for-changes can be really slow.
# you should disable it, if you work with large repositories
zstyle ':vcs_info:*' check-for-changes    true
zstyle ':vcs_info:*' unstagedstr       	  '%F{62}D%F{237}IRTY%f'   # display ¹ if there are unstaged changes
zstyle ':vcs_info:*' stagedstr            '%F{62}S%F{237}TAGED'    # display ² if there are staged changes
zstyle ':vcs_info:*' actionformats        "${FMT_BRANCH}${FMT_ACTION}" "${FMT_PATH}"
zstyle ':vcs_info:*' formats              "${FMT_BRANCH}"              "${FMT_PATH}"
zstyle ':vcs_info:*' nvcsformats          ""                           "%~"


zstyle ':completion:*' 		         	         rehash true # Persistent Rehash
zstyle ':completion:*'                       accept-exact '*(N)'
zstyle ':completion:*'                       match-list 'm:{A-Z}={a-z}'
zstyle ':completion:*'                       separate-sections 'yes'
zstyle ':completion:*'                       list-dirs-first true
zstyle ':completion:*:default'               list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*'                       menu select=2 eval "$(dircolors -b)"
zstyle ':completion:*'                       menu yes select
zstyle ':completion:*'                       use-perl=1
zstyle ':completion:*'                       squeeze-slashes true
zstyle ':completion:*'                       group-name ''
zstyle ':completion:*:cd:*'                  ignore-parents parent pwd

zstyle ':completion:*:(all-|)files'          ignored-patterns '*.un~'

#zstyle ':completion:*:processes'             command 'ps -axw'
#zstyle ':completion:*:processes-names'       command 'ps -awxho command'
zstyle ':completion:*'                       matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*:functions'             ignored-patterns '_*'

zstyle ':completion:*:(ls|mv|cp|rm|kill|diff):*' \
  ignore-line yes


zstyle ':completion:*:*:(scp):*' \
  file-sort modification

zstyle ':completion:*:*:(cd):*:*files' ignored-patterns '*~' file-sort access
zstyle ':completion:*:*:(cd):*'        file-sort access
zstyle ':completion:*:*:(cd):*'        menu yes select
zstyle ':completion:*:*:(cd):*'        completer _history

zstyle ':completion:*:*:perl:*'        file-patterns '*'

# zstyle kill menu
zstyle ':completion:*:*:kill:*'              menu yes select
zstyle ':completion:*:kill:*'                force-list always
zstyle ':completion:*:*:kill:*:processes'    list-colors "=(#b) #([0-9]#)*=36=31"
zstyle ':completion:*:kill:*'                command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'
zstyle ':completion:*:*:killall:*'           menu yes select
zstyle ':completion:*:killall:*'             force-list always
zstyle ':completion:*:*:killall:*:processes' list-colors "=(#b) #([0-9]#)*=36=31"

zstyle ':completion:*:descriptions' \
  format $'%{- \e[38;5;137;1m\e[48;5;234m%}%B%d%b%{\e[m%}'
zstyle ':completion:*:warnings' \
  format $'%{No match for \e[38;5;240;1m%}%d%{\e[m%}'

zstyle ':completion:most-accessed-file:*' match-original both
zstyle ':completion:most-accessed-file:*' file-sort access
zstyle ':completion:most-accessed-file:*' file-patterns '*:all\ files'
zstyle ':completion:most-accessed-file:*' hidden all
zstyle ':completion:most-accessed-file:*' completer _files


zstyle ':completion:*:scp:*' group-order \
      users files all-files hosts-domain hosts-host hosts-ipaddr

zstyle ':completion:*:ssh:*' tag-order \
      users 'hosts:-host hosts:-domain:domain hosts:-ipaddr:IP\ address *'

zstyle ':completion:*:ssh:*' group-order \
      hosts-domain hosts-host users hosts-ipaddr

zstyle ':completion:*:(ssh|scp):*:hosts-host' ignored-patterns \
      '*.*' loopback localhost

zstyle ':completion:*:(ssh|scp):*:hosts-domain' ignored-patterns \
      '<->.<->.<->.<->' '^*.*' '*@*'

zstyle ':completion:*:(ssh|scp):*:hosts-ipaddr' ignored-patterns \
      '^<->.<->.<->.<->' '127.0.0.<->'

zstyle ':completion:*:(ssh|scp):*:users' ignored-patterns \
      adm bin daemon halt lp named shutdown sync

zstyle ':completion:*:*:*:users' ignored-patterns \
        adm amanda apache avahi beaglidx bin cacti canna clamav daemon \
        dbus distcache dovecot fax ftp games gdm gkrellmd gopher \
        hacluster haldaemon halt hsqldb ident junkbust ldap lp mail \
        mailman mailnull mldonkey mysql nagios \
        named netdump news nfsnobody nobody nscd ntp nut nx openvpn \
        operator pcap postfix postgres privoxy pulse pvm quagga radvd \
        rpc rpcuser rpm shutdown squid sshd sync uucp vcsa xfs
zstyle '*' single-ignored show

# Quote stuff that looks like URLs automatically.
# tranks: http://chneukirchen.org/dotfiles/.zshrc
autoload -U url-quote-magic
zstyle ':urlglobber' url-other-schema ftp git gopher http https magnet
zstyle ':url-quote-magic:*' url-metas '*?[]^(|)~#='  # dropped { }
zle -N self-insert url-quote-magic

##
# TaskWarrior completion
zstyle ':completion:*:*:task:*' verbose yes
zstyle ':completion:*:*:task:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:*:task:*' group-name ''
