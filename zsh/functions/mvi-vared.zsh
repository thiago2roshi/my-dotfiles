# mv -- interactive rename, using vared
# http://chneukirchen.org/dotfiles/.zshrc
#
mvi-vared() {
  local src dst
  for src; do
    [[ -e $src ]] || { print -u2 "$src does not exist"; continue }
    dst=$src
    vared dst
    [[ $src != $dst ]] && mkdir -p $dst:h && mv -n $src $dst &&
      print -s mv -n $src:q:q $dst:q:q   
  done
}
