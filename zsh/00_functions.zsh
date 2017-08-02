##
# functions loader
##

# functions loader
for r in `dirname $0`/functions/**/*; do
    source "$r"
done

#fpath+="`dirname $0/functions`"
