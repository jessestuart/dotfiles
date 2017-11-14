scriptencoding
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Custom leader commands 💃
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" All about that, leader life.
let g:mapleader = ','

" =================
" Plugin management
" =================
map <leader>sc :source ~/.config/nvim/init.vim<CR>
map <leader>pi :PlugInstall<CR>
nmap <leader>up :PlugUpdate<CR>

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<CR>

" I would be lost without FZF.
nnoremap <leader>fz :FZF<CR>

map <leader>zen :Goyo<CR>

map <leader>n :NERDTreeToggle<CR>

" ======================
" Fast saving / closing.
" ======================
nmap <leader>w :w!<CR>
nmap <leader>1 :wq!<CR>
nmap <leader>q :q!<CR>
map <C-s> :w!<CR>
nmap <leader><space> :wq!<CR>

nnoremap <leader>ev :vsplit ~/.config/nvim/<CR>
" Nifty.
nnoremap <leader>== mz:,co-1<CR>2lv$r=:,co+1<CR>`z0w

" Vertical Split
nnoremap <leader>I :vsplit<CR>
" Vertical Split
nnoremap <leader>\ :vsplit<CR>
" Horizontal Split
nnoremap <leader>- :split<CR>
" Make the current buffer fill the window.
map <leader>z <C-W>T<CR>

map <Leader>gw :!git add . && git commit -m '[wip]'<cr>
map <Leader>re :%s/

map <Leader>e :e <C-R>=escape(expand("%:p:h"),' ') . '/'<CR>
map <Leader>sp :split <C-R>=escape(expand("%:p:h"), ' ') . '/'<CR>
map <Leader>vs :vnew <C-R>=escape(expand("%:p:h"), ' ') . '/'<CR>


"-----------------------------
" => Visual mode-related
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
map <leader>t<leader> :tabnext<CR>
map <leader>tp :tabpreviousCR>

let g:lasttab = 1
" Let 'tl' toggle between this and the last accessed tab
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


map <leader>alf :ALEFix<CR>


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

tnoremap <Esc> <C-\><C-n>
