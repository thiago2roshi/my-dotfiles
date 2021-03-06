# create a zkbd compatible hash;
# to add other keys to this hash, see: man 5 terminfo
bindkey -e        # Emacs Keybinds
typeset -A key

# Finally, make sure the terminal is in application mode, when zle is
# active. Only then are the values from $terminfo valid.
if (( ${+terminfo[smkx]} )) && (( ${+terminfo[rmkx]} )); then
    function zle-line-init () {
        echoti smkx
    }
    function zle-line-finish () {
        echoti rmkx
    }
    zle -N zle-line-init
    zle -N zle-line-finish
fi

key[Home]=${terminfo[khome]}
key[End]=${terminfo[kend]}
key[Insert]=${terminfo[kich1]}
#key[Delete]=${terminfo[kdch1]}
key[Delete]="^[[3~" # xst patch
key[Up]=${terminfo[kcuu1]}
key[Down]=${terminfo[kcud1]}
key[Left]=${terminfo[kcub1]}
key[Right]=${terminfo[kcuf1]}
key[PageUp]=${terminfo[kpp]}
key[PageDown]=${terminfo[knp]}
key[CtrlLeft]='[1;5D'
key[CtrlRight]='[1;5C'

# setup key accordingly
[[ -n "${key[Home]}"   ]]  && bindkey  "${key[Home]}"      beginning-of-line
[[ -n "${key[End]}"    ]]  && bindkey  "${key[End]}"       end-of-line
[[ -n "${key[Insert]}" ]]  && bindkey  "${key[Insert]}"    overwrite-mode
[[ -n "${key[Delete]}" ]]  && bindkey  "${key[Delete]}"    delete-char

#[[ -n "${key[Up]}"       ]]  && bindkey  "${key[Up]}"        up-line-or-history
#[[ -n "${key[Down]}"     ]]  && bindkey  "${key[Down]}"      down-line-or-history
[[ -n "${key[Up]}"    ]]  && bindkey  "${key[Up]}"        history-substring-search-up
[[ -n "${key[Down]}"  ]]  && bindkey  "${key[Down]}"      history-substring-search-down
[[ -n "${key[Left]}"  ]]  && bindkey  "${key[Left]}"      backward-char
[[ -n "${key[Right]}" ]]  && bindkey  "${key[Right]}"     forward-char

[[ -n "${key[CtrlLeft]}"  ]] && bindkey  "${key[CtrlLeft]}"  backward-word
[[ -n "${key[CtrlLeft]}"  ]] && bindkey  "${key[CtrlLeft]}"  emacs-backward-word
[[ -n "${key[CtrlRight]}" ]] && bindkey "${key[CtrlRight]}" forward-word
[[ -n "${key[CtrlRight]}" ]] && bindkey "${key[CtrlRight]}" emacs-forward-word

