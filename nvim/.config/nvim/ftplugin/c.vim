 " Only applied to C files
if &ft != 'c'
    finish
endif

" Set indentation options
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal expandtab
setlocal commentstring=//\ %s

" Define a mapping to insert a comment block
nnoremap <buffer> <LocalLeader>c o/**************<CR><CR>/<Esc>
