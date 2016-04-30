for FZSH in `dirname $0`/functions/**/*.zsh; do
    source "$FZSH"
done
# load completion folder
fpath+="`dirname $0`/completion"
