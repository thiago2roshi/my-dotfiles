# local variables

local -a TEXT IMGVW MVP

TEXT=(
  asm
  awk
  bash
  c
  cfg
  coffee
  conf
  cpp
  cs
  css
  csv
  diff
  enc
  eps
  etx
  ex
  example
  git
  gitignore
  go
  h
  hs
  htm
  html
  info
  ini
  java
  jhtm
  js
  jsm
  jsm
  json
  jsp
  lisp
  log
  lua
  map
  markdown
  md
  mf
  mfasl
  mi
  mkd
  mtx
  nfo
  pacnew
  patch
  pc
  pfa
  php
  pid
  PKGBUILD
  pl
  PL
  pm
  pod
  py
  rb
  rdf
  ru
  sed
  sfv
  sh
  signature
  sty
  sug
  t
  tcl
  tdy
  tex
  textile
  tfm
  tfnt
  theme
  txt
  twig
  urlview
  vim
  viminfo
  xml
  yml
  zsh
) 

MVP=(
  avi
  cue
  dat
  fcm
  flac
  flv
  m3u
  m4
  m4a
  m4v
  mkv
  mov
  mp3
  mp4
  mpeg
  MOV
  mpg
  ogg
  ogm
  ogv
  rmvb
  sample
  spl
  ts
  wmv
)
 
IMGVW=( 
  bmp
  cdr
  gif
  ico
  jpeg
  jpg
  JPG
  png
  svg
  xpm
)

alias -s  $^TEXT='nvim -X --'
alias -s $^IMGVW='meh --'
alias -s   $^MVP='mpv --'
