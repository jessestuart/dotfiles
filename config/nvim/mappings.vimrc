scriptencoding
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Custom mappings 🗺
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" All about that     leader life.
" ...Space. Map leader to space. Then hit that sucka' with either thumb.
" Makes `<leader` mappings even more comfortable.
" The `map <space> \` dance here is to prevent <space> from triggering
" unintended cursor movements when pressed by itself.
let g:mapleader = '\'
map <space> \

" ==========================
" vim-plug plugin management
" ==========================
" Reload configuration with <leader>sc
map <leader>sc :source ~/.config/nvim/init.vim<CR>
map <leader><space> :source ~/.config/nvim/init.vim<CR>
" Install new plugins with <leader>pi
map <leader>pi <leader>sc:PlugInstall<CR>
" Update all plugins with <leader>up
nmap <leader>up :source ~/dotfiles/config/nvim/init.vim<CR>:PlugInstall<CR>:PlugUpdate<CR>

" ==========================================
" Miscellaneous mappings I've grown to love.
" ==========================================
" I would be lost without FZF.
nnoremap <leader>fz :FZF<CR>
nnoremap <C-j> <CR>

" Toggle Goyo for distraction-free editing.
map <leader>zen :Goyo<CR>

" Toggle NERDTree. Call it a guilty pleasure.
map <leader>n :NERDTreeToggle<CR>

" I like wrapping comments in blocks of '=' characters.
nnoremap <leader>== mz:,co-1<CR>2lv$r=:,co+1<CR>`z0w

" Disable highlight with <leader><CR>.
map <silent> <leader><CR> :noh<CR>

" Shortcut to begin a substitution with
map <Leader>re :%s/

" Quickly move current line:
nnoremap ]e  :<c-u>execute 'move +'. v:count1<CR>
nnoremap [e  :<c-u>execute 'move -1-'. v:count1<CR>

" Quickly add empty lines:
nnoremap [<space>  :<c-u>put! =repeat(nr2char(10), v:count1)<CR>'[
nnoremap ]<space>  :<c-u>put =repeat(nr2char(10), v:count1)<CR>

" ======================
" Fast saving / closing.
" ======================
" Write buffer with <leader>w or ctrl+s. The latter works in insert mode too!
nmap <leader>w :w!<CR>
map <C-s> :w!<CR>
imap <C-s> :w!<CR>
" Write and close buffer with <leader>1.
nmap <leader>1 :wq!<CR>
" Close buffer unsaved with <leader>q.
nmap <leader>q :q!<CR>

" Repeat macros with `<leader>2`.
nnoremap <leader>2 @@

" Open neovim config directory with <leader>ev.
nnoremap <leader>ev :vsplit ~/.config/nvim/<CR>

map <Leader>gw :!git add . && git commit -m '[wip]'<CR>

"-----------------------------
" => Visual mode-related
"-----------------------------
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>
" Make the dot command work in visual mode. (h/t @danielmiessler)
vnoremap . :norm.<CR>

vnoremap <leader>s :sort<CR>
vnoremap <leader>si :sort i<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around buffers, windows, & tabs.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vertical Split
nnoremap <leader>i :vsplit<CR>
" Horizontal Split
nnoremap <leader>- :split<CR>
" Make the current buffer fill the window.
map <leader>z <C-W>T<CR>

map <Leader>e :e <C-R>=escape(expand("%:p:h"),' ') . '/'<CR>
map <Leader>sp :split <C-R>=escape(expand("%:p:h"), ' ') . '/'<CR>
map <Leader>vs :vnew <C-R>=escape(expand("%:p:h"), ' ') . '/'<CR>

" The only sane way to move between windows --- ctrl+{h|j|k|l}.
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Close the current buffer.
map <leader>bd :Bclose<CR>:tabclose<CR>gT
" Close all buffers.
map <leader>ba :bufdo bd<CR>
" Switch between next/previous buffers with <leader>l or <leader>h.
map <leader>l :bnext<CR>
map <leader>h :bprevious<CR>

" ============
" Manage tabs.
" ============
map <leader>tn :tabnew<CR>
map <leader>to :tabonly<CR>
map <leader>tc :tabclose<CR>
map <leader>tm :tabmove
map <leader>t<leader> :tabnext<CR>
map <leader>tp :tabprevious<CR>

let g:lasttab = 1
" Let 'tl' toggle between this and the last accessed tab
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
augroup tableave
  autocmd!
  autocmd TabLeave * let g:lasttab = tabpagenr()
augroup END

" Opens a new tab with the current buffer's path --
" Super useful when editing files in the same directory.
map <leader>te :tabedit <c-r>=expand("%:p:h")<CR>/

" Switch CWD to the directory of the open buffer.
map <leader>cd :cd %:p:h<CR>:pwd<CR>

" Specify the behavior when switching between buffers.
try
  set switchbuf=useopen,usetab,newtab
  set showtabline=2
catch
endtry

" =================
" Editing mappings.
" =================
" Remap VIM 0 to first non-blank character
map 0 ^

" Move a line of text using ALT+[jk].
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
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
let g:markdown_fenced_languages = [
  \ 'bash=sh', 'groovy', 'html', 'java', 'javascript', 'python']

" Sane way to switch out of neovim's :term mode with <Esc>.
tnoremap <Esc> <C-\><C-n>

nmap <silent> y' yi'
nmap <silent> yq yi'
nmap <silent> yqq yi"
