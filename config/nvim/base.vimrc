""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General configuration settings.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
scriptencoding
" Sets how many lines of history VIM has to remember.
set history=500

" Enable filetype plugins.
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside.
set autoread

" Enable line numbers. Make 'em relative.
set number
set relativenumber

" Show a colored gutter at 80 columns.
set colorcolumn=80
" Except in Git commit titles / messages, which are constrained to 50 / 72
" characters, respectively.
augroup gitcommit
  autocmd!
  autocmd FileType gitcommit set colorcolumn+=51
augroup END

function! RestoreCursor()
  if line("'\"") <= line('$')
    normal! g`"
    return 1
  endif
endfunction

augroup resCur
  autocmd!
  autocmd BufWinEnter * call RestoreCursor()
augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface (https://github.com/amix/vimrc)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Keep cursor in the middle when moving vertically using j/k.
set scrolloff=9999
" Hypen is part of the keyword.
set iskeyword+=-

" Turn on the WiLd menu.
set wildmenu
" Ignore compiled files.
set wildignore=*.o,*~,*.pyc,*.class
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
set wildignore+=*/node_modules/*
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
set wildignore+=nvim/plugged/*

" Always show current position.
set ruler

" Height of the command bar.
set cmdheight=1

" A buffer becomes hidden when it is abandoned.
set hidden

" Configure backspace so it acts as it should act.
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" ========================
" Searching / highlighting
" ========================
" Ignore case when searching.
set ignorecase

" When searching try to be smart about cases.
set smartcase

" Highlight search results.
set hlsearch

" Makes search act like search in modern browsers.
set incsearch

" Don't redraw while executing macros (good performance config).
set lazyredraw

" For regular expressions, turn magic on.
set magic

" Show matching brackets when text indicator is over them.
set showmatch

" How many tenths of a second to blink when matching brackets.
set matchtime=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=

" Add a bit of extra margin to the left gutter.
set foldcolumn=2

" Enable clipboard on unix systems.
set clipboard=unnamed

" Always show the statusline.
set laststatus=2

" Don't wait so long for the next keypress (particularly in ambigious <leader>
" situations.
set timeoutlen=500

" Don't automatically continue comments after newline
autocmd BufNewFile,BufRead * setlocal formatoptions-=cro

" Display whitespace characters.
set list listchars=tab:›\ ,trail:·,nbsp:␣,extends:↦,precedes:↤
" Or alternatively:
" set list listchars=tab:→\ ,trail:·
" set list listchars=tab:»\ ,trail:·
set fillchars=vert:┃,fold:·
set conceallevel=2

" =============
" Git shortcuts
" =============
nnoremap U  <nop>
nnoremap Up :<C-u>Gpush<CR>
nnoremap Us :<C-u>Gstatus<CR>
nnoremap Ud :<C-u>Gdiff<CR>
nnoremap Ub :<C-u>Merginal<CR>
nnoremap UB :<C-u>Gblame<CR>
nnoremap Uc :<C-u>Gcommit<CR>
nnoremap Uu :<C-u>Gpull<CR>
nmap     UU Uu

cabbrev G  Git
cabbrev G! Git!

" Expand abbreviations on enter.
inoremap <CR> <C-]><CR>
if executable('rg')
  set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case
  set grepformat=%f:%l:%c:%m,%f:%l%m,%f\ \ %l%m
endif

" Delete trailing whitespace on save.
function! DeleteTrailingWS()
  " Set a mark on the current line...
  exe 'normal mz'
  " Delete all trailing whitespace...
  exe ':%s/\s\+$//ge'
  " Return to the mark we just set...
  exe 'normal `z'
  " Then delete the mark to clean up after ourselves.
  exe ':delmarks z'
endfunction
augroup rm_trailing_whitespace
  autocmd!
  autocmd BufWrite * :call DeleteTrailingWS()
augroup END