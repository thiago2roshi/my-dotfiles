##
# Personal Customizations
# @thiagoroshi
##

export BIN_HOME="$HOME/bin"
export PAGER=${PAGER:-less}
export DEFAULT_USER="thiago"
export EDITOR='vim'
export VISUAL='vim'
export SUDO_EDITOR=vim

# PASS-TOMB
export PASSWORD_STORE_TOMB="/usr/local/bin/tomb"
export PASSWORD_STORE_TOMB_FILE="$HOME/.pass/pass.tomb"
export PASSWORD_STORE_TOMB_KEY="$HOME/.pass/pass.key.tomb"
export PASSWORD_STORE_TOMB_SIZE="20" # size in MB


# exportando path
export PATH="$HOME/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games/:/usr/local/games:$PATH"
export MANPATH="/usr/local/man:$MANPATH"

# icons-in-terminal completion
source "${HOME}/.local/share/icons-in-terminal/icons_bash.sh"

#  Less need some color to?
 export LESS_TERMCAP_mb=$'\E[01;31m'
 export LESS_TERMCAP_md=$'\E[01;31m'
 export LESS_TERMCAP_me=$'\E[0m'
 export LESS_TERMCAP_se=$'\E[0m'
 export LESS_TERMCAP_so=$'\E[01;44;33m'
 export LESS_TERMCAP_ue=$'\E[0m'
 export LESS_TERMCAP_us=$'\E[01;32m'

# Zplugins
TIPZ_TEXT=' 💡 alias: '

# LS_COLORS
source "${HOME}/.dotfiles/bash/LS_COLORS"

