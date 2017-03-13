# fix delete key in neovim for the time being
nvim(){
    tput smkx
    command nvim $@
}
