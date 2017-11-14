"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Put all temporary files under the same directory.
" https://github.com/mhinz/vim-galore#handling-backup-swap-undo-and-viminfo-files
set backup
set backupdir   =$HOME/.config/nvim/files/backup/
set backupext   =-vimbackup
set backupskip  =
set directory   =$HOME/.config/nvim/files/swap//
set updatecount =100
set undofile
set undodir     =$HOME/.config/nvim/files/undo/

" Use Unix as the standard file type
set fileformats=unix,dos,mac

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when we *have* to use tabs.
set smarttab

" 1 tab == 2 spaces by default.
set shiftwidth=2
set tabstop=2

" Linebreak on 500 characters
set linebreak

set autoindent
set smartindent

" Wrap lines.
set wrap
" Faster redrawing.
set ttyfast
" Only redraw when necessary.
set lazyredraw

" When at 3 spaces and I hit >>, go to 4, not 5.
set shiftround

" Say no to code folding.
set nofoldenable

" (Hopefully) removes the delay when hitting esc in insert mode.
set ttimeout
set ttimeoutlen=1

" Turn off spell-checking in markdown and text..
au BufRead,BufNewFile *.md,*.txt setlocal nospell

augroup markdown
    " remove previous autocmds
    autocmd!
    " set every new or read *.md buffer to use the markdown filetype
    autocmd BufRead,BufNew *.md setf markdown
augroup END
