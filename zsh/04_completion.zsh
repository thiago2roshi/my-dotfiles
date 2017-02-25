# autocompletion system
autoload -U ~/.dotfiles/zsh/completion/*(:t)
autoload -U ~/.dotfiles/zsh/gen-completion/*(:t)
autoload -U ~/.dotfiles/zsh/plugins/zsh-completions/src/*(:t)
autoload -U /usr/share/bash-completion/bash-completion

# some _compdef
# using _gnu_generec for --help of commands if not exist a "_completion" file
compdef _gnu_generic  ip iw
compdef _gnu_generic  grep
compdef _gnu_generic  make
compdef _vim          nvim

# Completion zstyle
zstyle ':completion:*'         squash-slash true
zstyle ':completion:*'         matcher-list '' 'm:{a-z}={A-Z}' 'r:|[._-/]=* r:|=*'
zstyle ':completion:*'         ignore-patterns '_*'
zstyle ':completion:*'         completer _complete _match _ignored
zstyle ':completion:*'         rehash true # Persistent Rehash
zstyle ':completion:*'         separate-sections 'yes'
zstyle ':completion:*'         list-dirs-first true
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

#zstyle ':completion:*' menu yes select
zstyle ':completion:*:*:(cd|kill|ls|mv|rename|rm|vim|nvim):*' menu yes select
zstyle ':completion:*:*:(cd|kill|ls|mv|rename|rm|vim|nvim):*' force-list always
zstyle ':completion:*:*:(cd|kill|ls|mv|rename|rm|vim|nvim):*' ignore-parents parent pwd
zstyle ':completion:*:*:(cd|kill|ls|mv|rename|rm|vim|nvim):*' list-dirs-first

zstyle ':completion:*:descriptions' format $'%{- \e[38;5;137;1m\e[48;5;234m%}%B%d%b%{\e[m%}'
zstyle ':completion:*:warnings'     format $'%{No match for \e[38;5;240;1m%}%d%{\e[m%}'
zstyle ':completion:*:messages'     format $'$F{3}%d%f'
zstyle ':completion:*:corrections'  format $'$F{4}%d%f'

zstyle ':completion:*:kill:*'                       command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'
zstyle ':completion:*:*:(kill|killall):*'           menu yes select
zstyle ':completion:*:(kill|killall):*'             force-list always
zstyle ':completion:*:*:(kill|killall):*:processes' list-colors "=(#b) #([0-9]#)*=36=31"

zstyle ':completion:*:*:*:users'    ignored-patterns \
        adm amanda apache avahi beaglidx bin cacti canna clamav daemon \
        dbus distcache dovecot fax ftp games gdm gkrellmd gopher \
        hacluster haldaemon halt hsqldb ident junkbust ldap lp \
        mail mailman mailnull mldonkey mysql nagios \
        named netdump news nfsnobody nobody nscd ntp nut nx openvpn \
        operator pcap postfix postgres privoxy pulse pvm quagga radvd \
        rpc rpcuser rpm shutdown squid sshd sync uucp vcsa xfs
zstyle ':completion:*:ssh:*'        tag-order \
      users 'hosts:-host hosts:-domain:domain hosts:-ipaddr:IP\ address *'
zstyle ':completion:*:ssh:*'        group-order \
      hosts-domain hosts-host users hosts-ipaddr
zstyle ':completion:*:(ssh|scp):*:hosts-host' ignored-patterns \
    '*.*' loopback localhost
zstyle ':completion:*:(ssh|scp):*:hosts-domain' ignored-patterns \
    '<->.<->.<->.<->' '^*.*' '*@*'
zstyle ':completion:*:(ssh|scp):*:hosts-ipaddr' ignored-patterns \
    '^<->.<->.<->.<->' '127.0.0.<->'

## Quote stuff that looks like URLs automatically.
# tranks: http://chneukirchen.org/dotfiles/.zshrc
autoload -U                 url-quote-magic
zstyle ':urlglobber'        url-other-schema ftp git gopher http https magnet
zstyle ':url-quote-magic:*' url-metas '*?[]^(|)~#='  # dropped { }
zle -N                      self-insert url-quote-magic

## VCS
# vcs_info
zstyle ':vcs_info:*'                   enable git hg svn
## check-for-changes can be really slow.
# you should disable it, if you work with large repositories
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr       '%F{62}D%F{237}IRTY%f'   # display ¹ if there are unstaged changes
zstyle ':vcs_info:*' stagedstr         '%F{62}S%F{237}TAGED'    # display ² if there are staged changes
zstyle ':vcs_info:*' actionformats     "${FMT_BRANCH}${FMT_ACTION}" "${FMT_PATH}"
zstyle ':vcs_info:*' formats           "${FMT_BRANCH}"              "${FMT_PATH}"
zstyle ':vcs_info:*' nvcsformats       ""                           "%~"

##
# TaskWarrior completion
zstyle ':completion:*:*:task:*' verbose yes
zstyle ':completion:*:*:task:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:*:task:*' group-name ''

# Caching files
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.cache/zsh
