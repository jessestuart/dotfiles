setlocal makeprg=terraform
setlocal formatprg=terraform\ fmt\ -
setlocal tabstop=2

" augroup autoformat
"     autocmd!
"     autocmd BufWritePre <buffer> normal! gggqG``
" augroup END
