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
    echoerr "Range spans multiple buffers"
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
      let StartOfLine = ""
    endif
    " The end bit
    if EndPosition[2] < len(CurrentLine)
      let EndOfLine = CurrentLine[EndPosition[2]:]
    else
      let EndOfLine = ""
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
