# confirm actions before executing
# its awesome
# @tranks slashbeast for dot'OWNED'files

confirm() {
    local answer
    echo -ne "zsh: sure you want to run '${YELLOW}$*${NC}' [yN]? "
    read -q answer
        echo
    if [[ "${answer}" =~ ^[Yy]$ ]]; then
        command "${@}"
    else
        return 1
    fi
}

confirm_wrapper() {
    if [ "$1" = '--root' ]; then
        local as_root='true'
        shift
    fi

    local prefix=''

    if [ "${as_root}" = 'true' ] && [ "${USER}" != 'root' ]; then
        prefix="sudo"
    fi
    confirm ${prefix} "$@"
}

# exemples 
poweroff()  { confirm_wrapper --root $0 "$@"; }
reboot()    { confirm_wrapper --root $0 "$@"; }
hibernate() { confirm_wrapper --root $0 "$@"; }
#shutdown()  { confirm_wrapper --root $0 "$@"; }
