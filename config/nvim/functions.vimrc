"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Helper functions (https://github.com/amix/vimrc)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! CmdLine(str)
    exe 'menu Foo.Bar :' . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute 'normal! vgvy'

    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", '', '')

    if a:direction ==# 'gv'
        call CmdLine("Ag '" . l:pattern . "' " )
    elseif a:direction ==# 'replace'
        call CmdLine('%s' . '/'. l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

" Don't close window when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr('%')
   let l:alternateBufNum = bufnr('#')

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr('%') == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute('bdelete! '.l:currentBufNum)
   endif
endfunction

" Z - cd to recent / frequent directories
command! -nargs=* Z :call Z(<f-args>)
function! Z(...)
  let l:cmd = 'fasd -d -e printf'
  for l:arg in a:000
    let l:cmd = l:cmd . ' ' . l:arg
  endfor
  let l:path = system(l:cmd)
  if isdirectory(l:path)
    echo l:path
    exec 'cd ' . "\"${path}\""
  endif
endfunction

" Tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
set wildmode=list:longest,list:full
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <Tab> <c-r>=InsertTabWrapper()<cr>
inoremap <S-Tab> <c-n>

" Delete trailing white space on save.
func! DeleteTrailingWS()
  exe 'normal mz'
  %s/\s\+$//ge
  exe 'normal `z'
endfunc
autocmd BufWrite * :call DeleteTrailingWS()

