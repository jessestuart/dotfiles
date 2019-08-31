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

" Swap colon and semicolon -- easier access to `ex` mode; just remember this
" requires using `:` to skip forward when using the `f` motion.
nnoremap ; :
nnoremap : ;

" ==========================
" vim-plug plugin management
" ==========================
noremap <leader>; :source ~/.config/nvim/init.vim<CR>:AirlineRefresh<CR>
" Install new plugins with <leader>pi
nnoremap <leader>pi :source ~/dotfiles/config/nvim/init.vim<CR>:PlugInstall<CR>
" Update all plugins with <leader>up
nnoremap <leader>up :source ~/dotfiles/config/nvim/init.vim<CR>:PlugInstall<CR>:PlugUpdate<CR>

" ==========================================
" Miscellaneous mappings I've grown to love.
" ==========================================
" I would be lost without FZF.
nnoremap <leader>fz :FZF<CR>

" Toggle Goyo for distraction-free editing.
nnoremap <leader>z :Goyo 80%x80%<CR>
nnoremap <leader>zz :Goyo!<CR>

" Toggle NERDTree. Call it a guilty pleasure.
nnoremap <leader>n :NERDTreeToggle<CR>

" =====================================================
" I like wrapping comments in blocks of '=' characters.
" vim-foo is fun.
" =====================================================
nnoremap <leader>== mz:,co-1<CR>2lv$r=:,co+1<CR>`z0w

" Disable highlight with <leader><CR>.
" noremap <silent> <leader><CR> :noh<CR>
noremap <silent> <leader><BS> :noh<CR>

" Shortcut to begin a substitution with
noremap <Leader>re :%s/

" Quickly move current line:
nnoremap ]e  :<c-u>execute 'move +'. v:count1<CR>
nnoremap [e  :<c-u>execute 'move -1-'. v:count1<CR>

" Quickly add empty lines:
nnoremap [<space>  :<c-u>put! =repeat(nr2char(10), v:count1)<CR>'[
nnoremap ]<space>  :<c-u>put =repeat(nr2char(10), v:count1)<CR>

" ======================
" Fast saving / closing.
" ======================
" Write buffer with <leader>w or <C-s>.
" The latter works in insert mode too, and will place you back in normal mode.
nnoremap <C-s> :w!<CR>
" inoremap <C-s> :w!<CR>
inoremap <C-s> <esc>:w!<CR>

" Write and close buffer with <leader>1.
nnoremap <leader>1 :wq!<CR>
" Close buffer unsaved with <leader>q.
nnoremap <leader>q :q!<CR>

" Repeat macros with `<leader>2`.
nnoremap <leader>2 @@

" Open neovim config directory with <leader>ev.
nnoremap <leader>ev :vsplit ~/.config/nvim/<CR>

nnoremap <Leader>gw :!git add . && git commit -m '[wip]'<CR>

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
nnoremap <leader>wn :rightbelow vnew<CR>
" Horizontal Split
nnoremap <leader>- :split<CR>
" Make the current buffer fill the window.
noremap <leader>Z <C-W>T<CR>
noremap <silent> <leader><CR> <C-W>T<CR>

noremap <Leader>e :e <C-R>=escape(expand("%:p:h"),' ') . '/'<CR>
noremap <Leader>sp :split <C-R>=escape(expand("%:p:h"), ' ') . '/'<CR>
noremap <Leader>vs :vnew <C-R>=escape(expand("%:p:h"), ' ') . '/'<CR>

" The only sane way to move between windows --- ctrl+{h|j|k|l}.
noremap <C-j> <C-W>j
noremap <C-k> <C-W>k
noremap <C-h> <C-W>h
noremap <C-l> <C-W>l

" Close the current buffer.
noremap <leader>bd :Bclose<CR>:tabclose<CR>gT
" Close all buffers.
noremap <leader>ba :bufdo bd<CR>
" Switch between next/previous buffers with <leader>l or <leader>h.
noremap <leader>bl :bnext<CR>
noremap <leader>bh :bprevious<CR>

noremap <leader>W <C-w>T

" ============
" Manage tabs.
" ============
noremap <leader>tn :tabnew<CR>
noremap <leader>to :tabonly<CR>
noremap <leader>tc :tabclose<CR>
noremap <leader>tm :tabmove
noremap <leader>t<leader> :tabnext<CR>
noremap <leader>tp :tabprevious<CR>

let g:lasttab = 1

" Opens a new tab with the current buffer's path --
" Super useful when editing files in the same directory.
noremap <leader>te :tabedit <c-r>=expand("%:p:h")<CR>/
noremap <leader>e :tabedit <c-r>=expand("%:p:h")<CR>/

" Switch CWD to the directory of the open buffer.
noremap <leader>cd :cd %:p:h<CR>:pwd<CR>

" Specify the behavior when switching between buffers.
try
  set switchbuf=useopen,usetab,newtab
  set showtabline=2
catch
endtry

" =================
" Editing mappings.
" =================
" Remap `0` to first non-blank character.
noremap 0 ^

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
noremap <leader>ss :setlocal spell!<CR>
noremap <leader>sn ]s
noremap <leader>sp [s
noremap <leader>sa zg
noremap <leader>s? z=

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" From Upcase
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:markdown_fenced_languages = [
  \ 'bash=sh', 'groovy', 'html', 'java', 'javascript', 'javascript.jsx', 'python',
  \ 'typescript', 'typescript.tsx'
  \ ]

" =========================================================
" Sane way to switch out of neovim's :term mode with <Esc>.
" =========================================================
tnoremap <Esc> <C-\><C-n>

nnoremap <silent> y' yi'
nnoremap <silent> yq yi'
nnoremap <silent> yqq yi"

" ============================================
" --------------- EXPERIMENTAL ---------------
" ============================================
nnoremap <M-tab> :tabprevious<CR>
nnoremap <M-q> :tabnext<CR>

" Opens up the fzf buffer search to navigate between open buffers.
nnoremap <Leader>bf :Buffers<CR>
" FZF most-recently-used file search.
noremap <Leader>h :History<CR>
" FZF :Ag search. (NB: customized elsewhere to use ripgrep)
noremap <Leader>f :Ag<CR>
" Searches the word under the cursor through the project tree using fzf and Ag.
noremap <Leader>d :exe ':Ag ' . expand('<cword>')<CR>

nnoremap <Leader>gg <CMD>GitGutterToggle<CR>
nnoremap <Leader>b <CMD>Gblame<CR>

nnoremap <leader>t <Cmd>TagbarToggle<CR>

" nnoremap <leader>p :silent !prettier --write --print-width=80 --prose-wrap=always %<CR>
" nnoremap <leader>p <Cmd>PrettierCli --write --print-width=80 --prose-wrap=always %<CR>
nnoremap <leader>p <Cmd>PrettierAsync<CR>

nnoremap <leader>ir :silent Inline2Ref<CR>

" noremap <C-t> :Files<CR>
" inoremap <C-t> <Cmd>Files<CR>

inoremap <silent><expr> <c-space> coc#refresh()

command! -nargs=? Filter let @a='' | execute 'g/<args>/y A' | new | setlocal bt=nofile | put! a
