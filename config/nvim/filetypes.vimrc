augroup Dockerfile
  autocmd!
  autocmd BufNewFile,BufRead Dockerfile* setf Dockerfile
augroup END

augroup markdown_formatting
  autocmd!
  autocmd BufRead,BufNewFile *.md   setlocal textwidth=80
  autocmd BufRead,BufNewFile *.wiki setlocal textwidth=80
augroup END
