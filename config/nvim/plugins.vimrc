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

command! -nargs=+ DeferPlug call Defer(<args>)

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
Plug 'ludovicchabant/vim-gutentags'
Plug 'machakann/vim-highlightedyank'
Plug 'michaeljsmith/vim-indent-object'
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
Plug 'vim-scripts/bufexplorer.zip'
Plug 'wellle/targets.vim'
Plug 'wincent/ferret'
Plug 'yegappan/mru'

" -------------------------------------
" Pope.
" -------------------------------------
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'

" -------------------------------------
" Git/Github-related plugins.
" -------------------------------------
Plug 'airblade/vim-gitgutter'
Plug 'codegram/vim-codereview'
Plug 'jreybert/vimagit'
Plug 'junegunn/vim-github-dashboard', { 'on': ['GHDashboard', 'GHActivity'] }
Plug 'junkblocker/patchreview-vim'
Plug 'mattn/webapi-vim' " Required for vim-github-comment
Plug 'mmozuras/vim-github-comment'
Plug 'idanarye/vim-merginal'
Plug 'cohama/agit.vim'

" -------------------------------------
" WebDev.
" -------------------------------------
Plug 'pangloss/vim-javascript'
Plug 'jelera/vim-javascript-syntax'
Plug 'mxw/vim-jsx'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'ternjs/tern_for_vim', { 'do': 'npm install jsctags --save-dev' }
Plug 'chrisbra/Colorizer'
" Plug 'Galooshi/vim-import-js' " This may not work?
Plug 'heavenshell/vim-jsdoc'
" Plug 'alampros/vim-styled-jsx'
" Plug 'mattn/emmet-vim'

DeferPlug 'prabirshrestha/async.vim'
DeferPlug 'prabirshrestha/vim-lsp'
DeferPlug 'yami-beta/asyncomplete-omni.vim'
DeferPlug 'prabirshrestha/asyncomplete-flow.vim'
DeferPlug 'prabirshrestha/asyncomplete-necovim.vim'
" Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
" Plug 'rhysd/vim-fixjson', { 'for': 'json' }

" ==========
" Typescript
" ==========
DeferPlug 'Quramy/tsuquyomi'
DeferPlug 'Quramy/vim-dtsm'
DeferPlug 'leafgarland/typescript-vim'

" -------------------------------------
" Tmux-related plugins.
" -------------------------------------
Plug 'christoomey/vim-tmux-navigator' " Nav b/t tmux panes & vim splits
Plug 'tmux-plugins/vim-tmux' " *Much* better syntax highlighting in tmux.conf.

" -------------------------------------
" Hashicorp / Devops-related plugins.
" -------------------------------------
DeferPlug 'hashivim/vim-packer'
DeferPlug 'hashivim/vim-terraform'
DeferPlug 'hashivim/vim-vagrant'
Plug 'pearofducks/ansible-vim'
Plug 'hejack0207/ansible.vim'

" -------------------------------------
" Visual styling / theming.
" -------------------------------------
Plug 'joshdick/onedark.vim'
Plug 'junegunn/goyo.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'itchyny/lightline.vim'

" -------------------------------------
" Misc. language support.
" -------------------------------------
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'modille/groovy.vim', { 'for': 'groovy' } " See note [1] below.
Plug 'alcesleo/vim-uppercase-sql', { 'for': 'sql' }
" DeferPlug 'plasticboy/vim-markdown'
DeferPlug 'jparise/vim-graphql'
DeferPlug 'ekalinin/Dockerfile.vim'
DeferPlug 'neovimhaskell/haskell-vim'
DeferPlug 'jaspervdj/stylish-haskell'
DeferPlug 'kchmck/vim-coffee-script'
" Plug 'chrisbra/csv.vim', { 'for': 'csv' }

" [1]: This groovy.vim ^ is the most up-to-date of the several on GitHub, with
" a number of improvements over the messy original from `vim-scripts`.

" ========================
" Autocomplete / Snippets.
" ========================
Plug 'SirVer/ultisnips'
Plug 'epilande/vim-es2015-snippets', { 'for': 'javascript' }
Plug 'epilande/vim-react-snippets', { 'for': 'javascript' }
Plug 'honza/vim-snippets'
Plug 'phenomenes/ansible-snippets', { 'for': ['ansible', 'yaml', 'yml'] }
" Place deoplete first, then autocomplete-flow
DeferPlug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
DeferPlug 'Shougo/neocomplete'
DeferPlug 'Shougo/neco-vim'
" Syntax source for neocomplete/deoplete/ncm
Plug 'Shougo/neco-syntax'
Plug 'autozimu/LanguageClient-neovim'
Plug 'wokalski/autocomplete-flow'
" You will also need the following for function argument completion:
" Plug 'Shougo/neosnippet'
" Plug 'Shougo/neosnippet-snippets'
" Plug 'Shougo/vimproc'

" -------------------------------------
" Time tracking, etc.
" -------------------------------------
if executable('gtm')
  Plug 'git-time-metric/gtm-vim-plugin'
endif
Plug 'wakatime/vim-wakatime'
" augroup LoadDuringHold_Targets
"     autocmd!
"     autocmd CursorHold,CursorHoldI * call plug#load('vim-wakatime') | autocmd! LoadDuringHold_Targets
" augroup end

" -------------------------------------
" Kubernetes, etc.
" -------------------------------------
DeferPlug 'c9s/vikube.vim'
DeferPlug 'mustache/vim-mustache-handlebars'
DeferPlug 'andrewstuart/vim-kubernetes'

" -------------------------------------
" Experimentation. Inbox.
" TODO: Organize these.
" -------------------------------------
Plug 'easymotion/vim-easymotion'
Plug 'ervandew/supertab'
Plug 'godlygeek/tabular'
DeferPlug 'junegunn/vim-peekaboo'
DeferPlug 'sjl/splice.vim'
DeferPlug 'rizzatti/dash.vim'
DeferPlug 'scrooloose/nerdcommenter'
DeferPlug 'vimwiki/vimwiki'
DeferPlug 'aaronbieber/vim-quicktask'
DeferPlug 'sunaku/vim-shortcut'
DeferPlug 'ktonga/vim-follow-my-lead'
DeferPlug 'wesQ3/vim-windowswap'
DeferPlug 'thaerkh/vim-workspace'
DeferPlug 'janko-m/vim-test'

DeferPlug 'jceb/vim-orgmode'
DeferPlug 'aaronbieber/vim-quicktask'
DeferPlug 'sjl/gundo.vim'
DeferPlug 'Chiel92/vim-autoformat'
" Plug 'vim-scripts/dbext.vim'
DeferPlug 'kassio/neoterm'
DeferPlug 'kristijanhusak/vim-carbon-now-sh'
DeferPlug 'elzr/vim-json'
DeferPlug 'majutsushi/tagbar'

Plug 'jpalardy/vim-slime'

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
" Plug 'sheerun/vim-polyglot'
" Plug 'tpope/vim-jdaddy'
"

call plug#end()
