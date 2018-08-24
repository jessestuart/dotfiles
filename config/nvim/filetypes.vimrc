augroup Dockerfile
  autocmd!
  autocmd BufNewFile,BufRead Dockerfile* setf Dockerfile
augroup END

augroup markdown_formatting
  autocmd!
  autocmd BufRead,BufNewFile *.md   setlocal textwidth=80
  autocmd BufRead,BufNewFile *.wiki setlocal textwidth=80
augroup END

augroup sass_kubernetes
  autocmd!
  autocmd BufRead,BufNewFile *.sass setlocal tabstop=4
  autocmd BufRead,BufNewFile *.sass setlocal noexpandtab
augroup END

augroup gitconfig
  autocmd!
  function! SetGitConfigOptions()
    setf gitconfig
    setlocal tabstop=2
    setlocal noexpandtab
  endfunction
  autocmd BufNewFile,BufRead gitconfig,.gitconfig call SetGitConfigOptions()
augroup END
