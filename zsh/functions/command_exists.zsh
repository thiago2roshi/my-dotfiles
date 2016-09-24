# Confirm if command exist - it's simple

command_exists ()
{
    if hash $1 2> /dev/null; then
        exit 0
    else
        exit 1
    fi
}
