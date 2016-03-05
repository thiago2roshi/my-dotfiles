# Path to your oh-my-zsh installation.
export ZSH=/home/thiago/.oh-my-zsh
ZSH_THEME="agnoster"
plugins=(git pass taskwarrior colored-man-pages)

# User configuration
export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
# export MANPATH="/usr/local/man:$MANPATH"
source $ZSH/oh-my-zsh.sh
 
# You may need to manually set your language environment
export LANG=pt_BR.UTF-8

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"
for FZSH in $HOME/.dotfiles/zsh/*.zsh; do
    source "$FZSH"
done

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
