" PHP ViM configs

setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal expandtab

" Syntastic - check syntax
packadd syntastic
let g:syntastic_php_checkers=['php', 'phpcs']
let g:syntastic_php_phpcs_args='--standard=PSR2 -n'

let php_sql_query=1
let php_baselib=1
let php_htmlInStrings=1
let php_folding=0
