# pstop -- ps with top-like output
# http://chneukirchen.org/dotfiles/.zshrc
pstop() {
  ps -eo pid,user,pri,ni,vsz,rsz,stat,pcpu,pmem,time,comm --sort -pcpu |
    head "${@:--n 20}"
}

