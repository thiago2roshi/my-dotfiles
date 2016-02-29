# Forcando terminal a trabalhar com 256 cores 
 export TERM="xterm-256color"

# Path to your oh-my-zsh installation.
 export ZSH=/home/thiago/.oh-my-zsh

# Setando Tema a ser usado
 ZSH_THEME="powerlevel9k/powerlevel9k"

# Uncomment the following line to change how often to auto-update (in days).
 export UPDATE_ZSH_DAYS=15

# Uncomment the following line to enable command auto-correction.
 ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
 COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
 HIST_STAMPS="dd/mm/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(\
          autocomplete colorize colored-man-pages  \
          command-not-found docker git gitfast     \
          pass taskwarrior zsh-syntax-highlighting \
        )

# User configuration
 export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
 export MANPATH="/usr/local/man:$MANPATH"

 source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
 export LANG=pt_BR.UTF-8
# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='vim'
 fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
 export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

 source $HOME/.dotfiles/zsh/zsh_aliases.sh
 source $HOME/.dotfiles/zsh/zsh_custom.sh
