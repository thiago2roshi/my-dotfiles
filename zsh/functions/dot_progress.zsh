# confirm actions before executing
# its awesome
# @tranks slashbeast for dot'OWNED'files

dot_progress() {
    # Fancy progress function from Landley's Aboriginal Linux.
    # Useful for long rm, tar and such.
    # Usage: 
    #     rm -rfv /foo | dot_progress
    local i='0'
    local line=''

    while read line; do
        i="$((i+1))"
        if [ "${i}" = '25' ]; then
            printf '.'
            i='0'
        fi
    done
    printf '\n'
}
