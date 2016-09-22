##
# functions loader
##

# functions loader
for r in `dirname $0`/functions/**/*; do
    source "$r"
done


# load completion folder
fpath+=(`dirname $0`/completion)

# load generate completion folder
fpath+=(`dirname $0`/gen-completion)

