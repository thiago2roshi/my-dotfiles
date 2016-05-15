# functions loader
for r in `dirname $0`/functions/**/*.zsh; do
    source "$r"
done
