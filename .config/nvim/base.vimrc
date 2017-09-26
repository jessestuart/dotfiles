""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General configuration settings.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
autocmd FileType gitcommit set colorcolumn+=51

" Make VIM remember position in file after reopen
if has('autocmd')
  autocmd BufReadPost *
    \ if line("'\"") >= 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface (https://github.com/amix/vimrc)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the cursor - when moving vertically using j/k.
set scrolloff=7

" Turn on the WiLd menu.
set wildmenu
" Ignore compiled files.
set wildignore=*.o,*~,*.pyc,*.class
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
set wildignore+=node_modules/*

" Always show current position.
set ruler

" Height of the command bar.
set cmdheight=1

" A buffer becomes hidden when it is abandoned.
set hidden

" Configure backspace so it acts as it should act.
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

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

" For regular expressions turn magic on.
set magic

" Show matching brackets when text indicator is over them.
set showmatch
" How many tenths of a second to blink when matching brackets.
set matchtime=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set timeoutlen=500

" Add a bit extra margin to the left.
set foldcolumn=2

" Enable clipboard on unix systems.
set clipboard=unnamed

""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the statusline.
set laststatus=2
