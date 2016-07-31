# colored syntax in less
# @tranks xero
color-less() {
    pygmentize -O style=monokai -f console256 -g $1  | less -r
}

