scriptencoding
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Custom leader commands 💃
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" All about that, leader life.
let g:mapleader = ','

" Quickly open a markdown buffer for scribble
map <leader>md :e ~/buffer.md<CR>
" Toggle paste mode on and off
map <leader>pp :setlocal paste!<CR>

nnoremap <leader>fz :FZF<CR>
nnoremap <leader>ff :FZF<CR>

map <leader>Z :Goyo<CR>
map <leader>sc :source ~/.config/nvim/init.vim<CR>
map <leader>pi :PlugInstall<CR>
nmap <leader>up :PlugUpdate<CR>

map <leader>n :NERDTreeToggle<CR>
map <leader>z <C-W>T<CR>

" Fast saving / closing.
nmap <leader>w :w!<CR>
nmap <leader>1 :wq!<CR>
nmap <leader>q :q!<CR>


nnoremap <leader>ev :vsplit ~/.config/nvim/<CR>

" SPLITS
nnoremap <leader>I :vsplit<CR>
nnoremap <leader>\ :vsplit<CR>
nnoremap <leader>- :split<CR>

"-----------------------------
" => Visual mode related
"-----------------------------
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>
" Make the dot command work in visual mode! (courtesy of @danielmiessler)
vnoremap . :norm.<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
" map <space> /
" map <c-space> ?

" Disable highlight when <leader><CR> is pressed
map <silent> <leader><CR> :noh<CR>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Close the current buffer
map <leader>bd :Bclose<CR>:tabclose<CR>gT

" Close all the buffers
map <leader>ba :bufdo bd<CR>

map <leader>l :bnext<CR>
map <leader>h :bprevious<CR>

" Useful mappings for managing tabs
map <leader>tn :tabnew<CR>
map <leader>to :tabonly<CR>
map <leader>tc :tabclose<CR>
map <leader>tm :tabmove
map <leader>t<leader> :tabnext

" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<CR>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<CR>:pwd<CR>

" Specify the behavior when switching between buffers
try
  set switchbuf=useopen,usetab,newtab
  set showtabline=2
catch
endtry

" Quickly move current line:
nnoremap ]e  :<c-u>execute 'move +'. v:count1<CR>
nnoremap [e  :<c-u>execute 'move -1-'. v:count1<CR>

" Quickly add empty lines:
nnoremap [<space>  :<c-u>put! =repeat(nr2char(10), v:count1)<CR>'[
nnoremap ]<space>  :<c-u>put =repeat(nr2char(10), v:count1)<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap VIM 0 to first non-blank character
map 0 ^

" Move a line of text using ALT+[jk] or Command+[jk] on mac
nmap <M-j> mz:m+<CR>`z
nmap <M-k> mz:m-2<CR>`z
vmap <M-j> :m'>+<CR>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<CR>`>my`<mzgv`yo`z
if has('mac') || has('macunix')
  nmap <D-j> <M-j>
  nmap <D-k> <M-k>
  vmap <D-j> <M-j>
  vmap <D-k> <M-k>
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<CR>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" From Upcase
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Neat neovim feature -- automatically preview `:s` substitutions in
" real-time.
if exists('&inccommand')
  set inccommand=split
endif

autocmd BufNewFile,BufReadPost *.md set filetype=markdown
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh', 'java', 'javascript', 'groovy']

