##
# functions loader
##

# functions loader
for r in `dirname $0`/functions/**/*.zsh; do
    source "$r"
done

# load completion folder
fpath+="`dirname $0`/completion"

# finishing loading completion system
autoload -U compinit && compinit
