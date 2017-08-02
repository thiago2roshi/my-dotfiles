# fix delete key in neovim for the time being
nvim(){
    tput smkx
    command nvim $@
}
to-lower-case(){
    zmv '(*)' '${1:l}'
}
trim-spaces(){
    zmv '(*)' '${1//\ /_/}'
}
