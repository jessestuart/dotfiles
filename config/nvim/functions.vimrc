"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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

" Function allowing either sorting multiple lines individually or sorting part
" of one line, depending on the visual selection.
" h/t https://stackoverflow.com/questions/1327978/sorting-words-not-lines-in-vim
command! -nargs=0 -range SortWords call SortWords()
" Add a mapping, go to your string, then press vi",s
" vi" selects everything inside the quotation
" ,s calls the sorting algorithm
vmap ,s :SortWords<CR>
" Normal mode one: ,s to select the string and sort it
nmap ,s vi",s

function! SortWords()
  " Get the visual mark points
  let StartPosition = getpos("'<")
  let EndPosition = getpos("'>")

  if StartPosition[0] != EndPosition[0]
    echoerr 'Range spans multiple buffers'
  elseif StartPosition[1] != EndPosition[1]
    " This is a multiple line range, probably easiest to work line wise

    " This could be made a lot more complicated and sort the whole
    " lot, but that would require thoughts on how many
    " words/characters on each line, so that can be an exercise for
    " the reader!
    for LineNum in range(StartPosition[1], EndPosition[1])
      call setline(LineNum, join(sort(split(getline('.'), ' ')), " "))
    endfor
  else
    " Single line range, sort words
    let CurrentLine = getline(StartPosition[1])

    " Split the line into the prefix, the selected bit and the suffix

    " The start bit
    if StartPosition[2] > 1
      let StartOfLine = CurrentLine[:StartPosition[2]-2]
    else
      let StartOfLine = ''
    endif
    " The end bit
    if EndPosition[2] < len(CurrentLine)
      let EndOfLine = CurrentLine[EndPosition[2]:]
    else
      let EndOfLine = ''
    endif
    " The middle bit
    let BitToSort = CurrentLine[StartPosition[2]-1:EndPosition[2]-1]

    " Move spaces at the start of the section to variable StartOfLine
    while BitToSort[0] == ' '
      let BitToSort = BitToSort[1:]
      let StartOfLine .= ' '
    endwhile
    " Move spaces at the end of the section to variable EndOfLine
    while BitToSort[len(BitToSort)-1] == ' '
      let BitToSort = BitToSort[:len(BitToSort)-2]
      let EndOfLine = ' ' . EndOfLine
    endwhile

    " Sort the middle bit
    let Sorted = join(sort(split(BitToSort, ' ')), ' ')
    " Reform the line
    let NewLine = StartOfLine . Sorted . EndOfLine
    " Write it out
    call setline(StartPosition[1], NewLine)
  endif
endfunction

" From Drew Neil + https://github.com/stoeffel/.dotfiles/blob/master/vim/visual-at.vim
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>
function! ExecuteMacroOverVisualRange()
  echo '@'.getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction

command! -nargs=? Filter let @a='' | execute 'g/<args>/y A' | new | setlocal bt=nofile | put! a

" Called with a command and a redirection target
"   (see `:help redir` for info on redirection targets)
" Note that since this is executed in function context,
"   in order to target a global variable for redirection you must prefix it with `g:`.
" EG call Redir('ls', '=>g:buffer_list')
funct! Redir(command, to)
  exec 'redir '.a:to
  exec a:command
  redir END
endfunct
" The last non-space substring is passed as the redirection target.
" EG
"   :R ls @">
"   " stores the buffer list in the 'unnamed buffer'
" Redirections to variables or files will work,
"   but there must not be a space between the redirection operator and the variable name.
" Also note that in order to redirect to a global variable you have to preface it with `g:`.
"   EG
"     :R ls =>g:buffer_list
"     :R ls >buffer_list.txt
command! -nargs=+ R call call(function('Redir'), split(<q-args>, '\s\(\S\+\s*$\)\@='))

function! OutputSplitWindow(...)
  " this function output the result of the Ex command into a split scratch buffer
  let cmd = join(a:000, ' ')
  let temp_reg = @"
  redir @"
  silent! execute cmd
  redir END
  let output = copy(@")
  let @" = temp_reg
  if empty(output)
    echoerr "no output"
  else
    vnew
    setlocal buftype=nofile bufhidden=wipe noswapfile nobuflisted
    put! =output
  endif
endfunction
command! -nargs=+ -complete=command Output call OutputSplitWindow(<f-args>)
