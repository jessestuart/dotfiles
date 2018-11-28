" =================================================
" Functions to help enable lazy-loading of plugins.
" @see https://www.reddit.com/r/vim/comments/7datnj/vimplug_cursorhold_and_ondemand_loading/
" =================================================
function! LoadAndDestroy(plugin, ...) abort
  call plug#load(a:plugin)
  execute 'autocmd! Defer_'.a:plugin
  if a:0
    execute a:1
  endif
endfunction

function! Defer(github_ref, ...) abort
  if !has('vim_starting')
    return
  endif
  let plug_args = a:0 ? a:1 : {}
  call extend(plug_args, { 'on': [] })
  call plug#(a:github_ref, plug_args)
  let plugin = a:github_ref[stridx(a:github_ref, '/') + 1:]
  let lad_args = '"'.plugin.'"'
  if a:0 > 1
    let lad_args .= ', "'.a:2.'"'
  endif
  let call_loadAndDestroy = 'call LoadAndDestroy('.lad_args.')'
  execute 'augroup Defer_'.plugin.' |'
        \ '  autocmd CursorHold,CursorHoldI * '.call_loadAndDestroy.' | '
        \ 'augroup end'
endfunction

command! -nargs=+ Plug call Defer(<args>)

call plug#begin()
" -------------------------------------
" Text Editing.
" -------------------------------------
Plug 'alvan/vim-closetag'
Plug 'christoomey/vim-sort-motion'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/vim-easy-align'
Plug 'osyo-manga/vim-over'
Plug 'reedes/vim-pencil'
Plug 'tommcdo/vim-exchange'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'

" ============================
" Linting / fixing. Must have.
" ============================
Plug 'w0rp/ale'

" -------------------------------------
" File management, searching, etc.
" Getting around.
" -------------------------------------
Plug 'ctrlpvim/ctrlp.vim'
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/is.vim' " Doesn't seem to work compared to `incsearch`...?
Plug 'haya14busa/vim-asterisk'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'justinmk/vim-dirvish'
Plug 'justinmk/vim-sneak'
Plug 'machakann/vim-highlightedyank'
Plug 'michaeljsmith/vim-indent-object'
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
Plug 'wincent/ferret'
" Plug 'vim-scripts/bufexplorer.zip'
" Plug 'wellle/targets.vim'
" Plug 'yegappan/mru'

if executable('ctags')
  Plug 'ludovicchabant/vim-gutentags'
endif

" -------------------------------------
" Pope.
" -------------------------------------
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
" Plug 'tpope/vim-projectionist'

" -------------------------------------
" Git/Github-related plugins.
" -------------------------------------
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'jreybert/vimagit'
Plug 'junegunn/vim-github-dashboard', { 'on': ['GHDashboard', 'GHActivity'] }
Plug 'zivyangll/git-blame.vim'
Plug 'christoomey/vim-conflicted'
" Plug 'codegram/vim-codereview'
" Plug 'junkblocker/patchreview-vim'
" Plug 'mattn/webapi-vim' " Required for vim-github-comment
" Plug 'idanarye/vim-merginal'
" Plug 'cohama/agit.vim'

" -------------------------------------
" WebDev.
" -------------------------------------
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'prettier/vim-prettier', {
\ 'branch': 'release/1.x',
\ 'do': 'yarn install',
\ 'for': ['javascript', 'typescript', 'css',
\         'less', 'scss', 'json', 'graphql', 'markdown', 'vue',
\         'javascript.jsx', 'typescript.tsx', 'yaml', 'pandoc'
\]}
Plug 'ternjs/tern_for_vim', { 'do': 'npm install jsctags --save-dev' }
Plug 'chrisbra/Colorizer'
Plug 'Galooshi/vim-import-js', { 'do': 'yarn install' } " This may not work?
Plug 'heavenshell/vim-jsdoc'
Plug 'jelera/vim-javascript-syntax'
Plug 'alampros/vim-styled-jsx'
Plug 'jxnblk/vim-mdx-js'
Plug 'othree/javascript-libraries-syntax.vim'
" Plug 'mattn/emmet-vim'

" Plug 'prabirshrestha/vim-lsp'
Plug 'yami-beta/asyncomplete-omni.vim'
Plug 'prabirshrestha/async.vim'

Plug 'prabirshrestha/asyncomplete-flow.vim'
Plug 'prabirshrestha/asyncomplete-necovim.vim'
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
" Plug 'rhysd/vim-fixjson', { 'for': 'json' }

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" For Denite features
Plug 'Shougo/denite.nvim'

" ==========
" Typescript
" ==========

Plug 'Quramy/tsuquyomi'
Plug 'Quramy/vim-dtsm'
Plug 'Quramy/vim-js-pretty-template'
Plug 'peitalin/vim-jsx-typescript'
Plug 'jason0x43/vim-js-indent'
Plug 'HerringtonDarkholme/yats.vim'

" Plug 'mhartington/nvim-typescript', {'do': './install.sh'}
" Plug 'leafgarland/typescript-vim'

" -------------------------------------
" Tmux-related plugins.
" -------------------------------------
Plug 'christoomey/vim-tmux-navigator' " Nav b/t tmux panes & vim splits
Plug 'tmux-plugins/vim-tmux' " *Much* better syntax highlighting in tmux.conf.

" -------------------------------------
" Hashicorp / Devops-related plugins.
" -------------------------------------
Plug 'hashivim/vim-packer'
Plug 'hashivim/vim-terraform'
Plug 'hashivim/vim-vagrant'
" Plug 'pearofducks/ansible-vim'
" Plug 'hejack0207/ansible.vim'

" -------------------------------------
" Visual styling / theming.
" -------------------------------------
Plug 'joshdick/onedark.vim'
Plug 'junegunn/goyo.vim'
Plug 'ryanoasis/vim-devicons'
" Plug 'itchyny/lightline.vim'
Plug 'vim-airline/vim-airline'

" -------------------------------------
" Misc. language support.
" -------------------------------------
Plug 'sheerun/vim-polyglot'
Plug 'ekalinin/Dockerfile.vim'
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'alcesleo/vim-uppercase-sql', { 'for': 'sql' }
Plug 'jparise/vim-graphql'
" Plug 'modille/groovy.vim', { 'for': 'groovy' } " See note [1] below.
" Plug 'neovimhaskell/haskell-vim'
" Plug 'jaspervdj/stylish-haskell'
" Plug 'kchmck/vim-coffee-script'

" [1]: This groovy.vim ^ is the most up-to-date of the several on GitHub, with
" a number of improvements over the messy original from `vim-scripts`.

" ========================
" Autocomplete / Snippets.
" ========================
" Plug 'SirVer/ultisnips'
" Plug 'epilande/vim-es2015-snippets', { 'for': 'javascript' }
" Plug 'epilande/vim-react-snippets', { 'for': 'javascript' }
" Plug 'honza/vim-snippets'
" Plug 'phenomenes/ansible-snippets', { 'for': ['ansible', 'yaml', 'yml'] }

" Place deoplete first, then autocomplete-flow
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'Shougo/neocomplete'
" Plug 'Shougo/neco-vim'
" Syntax source for neocomplete/deoplete/ncm
" Plug 'Shougo/neco-syntax'

Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

Plug 'wokalski/autocomplete-flow'
" You will also need the following for function argument completion:
" Plug 'Shougo/neosnippet'
" Plug 'Shougo/neosnippet-snippets'

" Plug 'flowtype/vim-flow'

" -------------------------------------
" Time tracking, etc.
" -------------------------------------
if executable('gtm')
endif
Plug 'git-time-metric/gtm-vim-plugin'
if executable('wakatime')
  Plug 'wakatime/vim-wakatime'
endif
" augroup LoadDuringHold_Targets
"     autocmd!
"     autocmd CursorHold,CursorHoldI * call plug#load('vim-wakatime') | autocmd! LoadDuringHold_Targets
" augroup end

" -------------------------------------
" Kubernetes, etc.
" -------------------------------------
Plug 'c9s/vikube.vim'
Plug 'mustache/vim-mustache-handlebars'
Plug 'andrewstuart/vim-kubernetes'

" -------------------------------------
" Experimentation. Inbox.
Plug 'easymotion/vim-easymotion'
" Plug 'ervandew/supertab'
Plug 'godlygeek/tabular'
Plug 'vimwiki/vimwiki'
Plug 'junegunn/vim-peekaboo'
Plug 'sjl/splice.vim'
" Plug 'rizzatti/dash.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'aaronbieber/vim-quicktask'
Plug 'sunaku/vim-shortcut'
Plug 'ktonga/vim-follow-my-lead'
Plug 'wesQ3/vim-windowswap'
Plug 'thaerkh/vim-workspace'
Plug 'janko-m/vim-test'

Plug 'jceb/vim-orgmode'
Plug 'sjl/gundo.vim'
Plug 'Chiel92/vim-autoformat'
" Plug 'vim-scripts/dbext.vim'
" Plug 'kassio/neoterm'
" Plug 'kristijanhusak/vim-carbon-now-sh'
Plug 'majutsushi/tagbar'
Plug 'rhysd/clever-f.vim'
Plug 'gregsexton/gitv'

" Plug 'jpalardy/vim-slime'

" Plug 'eraserhd/parinfer-rust'

Plug 'sbdchd/neoformat'

Plug 'jaawerth/nrun.vim'

" Plug 'ruanyl/vim-sort-imports'

" Plug 'wincent/command-t'

" Figure out why this causes errors calling DeleteTrailingWhitepace() on exit.
" Plug 'kshenoy/vim-signature'

" =================
" --- Graveyard ---
" =================
" (May be temporary or permanent)
"      _____
"    //  +  \
"   ||  RIP  |
"   ||       |
"   ||       |
"  \||/\/\//\|/
" Plug 'maralla/completor.vim'
" Plug 'Shougo/denite.nvim'
" Plug 'fmoralesc/vim-tutor-mode'
" Plug 'tpope/vim-jdaddy'
" Plug 'chrisbra/csv.vim', { 'for': 'csv' }
" Plug 'plasticboy/vim-markdown'

" assuming your using vim-plug: https://github.com/junegunn/vim-plug
" Plug 'ncm2/ncm2'
" Plug 'roxma/nvim-yarp'

" " enable ncm2 for all buffers
" autocmd BufEnter * call ncm2#enable_for_buffer()
" " IMPORTANT: :help Ncm2PopupOpen for more information
" set completeopt=noinsert,menuone,noselect

" " NOTE: you need to install completion sources to get completions. Check
" " our wiki page for a list of sources: https://github.com/ncm2/ncm2/wiki
" Plug 'ncm2/ncm2-bufword'
" Plug 'ncm2/ncm2-tmux'
" Plug 'ncm2/ncm2-path'
" Plug 'ncm2/ncm2-tern', { 'do': 'npm install' }

call plug#end()
