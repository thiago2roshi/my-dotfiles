##
# functions loader
##

# functions loader
for r in `dirname $0`/functions/**/*; do
    source "$r"
done


# load completion folder
fpath+="`dirname $0`/completion"
fpath+="`dirname $0`/gen-completion"
fpath+="/usr/share/bash-completion/bash-completion"

# zsh-completions plugins
fpath+="`dirname $0`/plugins/zsh-completions/src"


#for r in `dirname $0`/plugins/*.zsh; do
#    if [[ $DEBUG > 0 ]]; then
#        echo "zsh: sourcing $r"
#    fi
#    source $r
#done
