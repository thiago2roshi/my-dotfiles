source ~/.zplug/zplug

zplug "caiogondim/bullet-train-oh-my-zsh-theme"

# Make sure you use double quotes
zplug "zsh-users/zsh-history-substring-search"
zplug "plugins/git",   from:oh-my-zsh, if:"which git"
zplug "djui/alias-tips", as:plugin
zplug "felixr/docker-zsh-completion", as:plugin
zplug "zlsun/solarized-man", as:plugin

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set priority to load command like a nice command
# e.g., zsh-syntax-highlighting must be loaded
# after executing compinit command and sourcing other plugins

zplug "zsh-users/zsh-syntax-highlighting", nice:10

if ! zplug check; then
    zplug install
fi

# source and add to the PATH
zplug load

for FZSH in $HOME/.dotfiles/zsh/**/*.zsh; do
    source "$FZSH"
done
