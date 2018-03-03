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
" ----

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

" -------------------------------------
" WebDev.
" -------------------------------------
Plug 'pangloss/vim-javascript'
Plug 'jelera/vim-javascript-syntax'
Plug 'mxw/vim-jsx'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'ternjs/tern_for_vim', { 'do': 'npm install jsctags --save-dev' }
Plug 'chrisbra/Colorizer'
Plug 'Galooshi/vim-import-js' " This may not work?
" Plug 'alampros/vim-styled-jsx'
" Plug 'mattn/emmet-vim'

Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'yami-beta/asyncomplete-omni.vim'
Plug 'prabirshrestha/asyncomplete-flow.vim'
Plug 'prabirshrestha/asyncomplete-necovim.vim'
" Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
" Plug 'rhysd/vim-fixjson', { 'for': 'json' }

" ==========
" Typescript
" ==========
Plug 'Quramy/tsuquyomi'
Plug 'leafgarland/typescript-vim'

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
Plug 'pearofducks/ansible-vim'
Plug 'hejack0207/ansible.vim'

" -------------------------------------
" Visual styling / theming.
" -------------------------------------
Plug 'junegunn/goyo.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'joshdick/onedark.vim'
Plug 'rakr/vim-one'
Plug 'KeitaNakamura/neodark.vim'
Plug 'itchyny/lightline.vim'

" -------------------------------------
" Misc. language support.
" -------------------------------------
Plug 'alcesleo/vim-uppercase-sql', { 'for': 'sql' }
Plug 'chrisbra/csv.vim', { 'for': 'csv' }
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'modille/groovy.vim', { 'for': 'groovy' }
Plug 'plasticboy/vim-markdown'
Plug 'jparise/vim-graphql'
Plug 'ekalinin/Dockerfile.vim'
Plug 'neovimhaskell/haskell-vim'
Plug 'jaspervdj/stylish-haskell'
" This groovy.vim ^ is the most up-to-date of the several on GitHub, with a
" number of over the messy original from `vim-scripts`.

" ========================
" Autocomplete / Snippets.
" ========================
" Place deoplete first, then autocomplete-flow
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neocomplete'
Plug 'Shougo/neco-vim'
" Syntax source for neocomplete/deoplete/ncm
Plug 'Shougo/neco-syntax'
Plug 'autozimu/LanguageClient-neovim'
Plug 'wokalski/autocomplete-flow'
" You will also need the following for function argument completion:
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'

" -------------------------------------
" Time tracking, etc.
" -------------------------------------
if executable('gtm')
  Plug 'git-time-metric/gtm-vim-plugin'
endif
Plug 'wakatime/vim-wakatime', {'on': []}
augroup LoadDuringHold_Targets
    autocmd!
    autocmd CursorHold,CursorHoldI * call plug#load('vim-wakatime') | autocmd! LoadDuringHold_Targets
augroup end

" -------------------------------------
" Experimentation. Inbox.
" TODO: Organize these.
" -------------------------------------
Plug 'easymotion/vim-easymotion'
Plug 'ervandew/supertab'
Plug 'godlygeek/tabular'
Plug 'junegunn/vim-peekaboo'
Plug 'sjl/splice.vim'
Plug 'rizzatti/dash.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'vimwiki/vimwiki'
Plug 'aaronbieber/vim-quicktask'
Plug 'sunaku/vim-shortcut'
Plug 'ktonga/vim-follow-my-lead'
Plug 'wesQ3/vim-windowswap'
Plug 'thaerkh/vim-workspace'
Plug 'janko-m/vim-test'

Plug 'jceb/vim-orgmode'
Plug 'aaronbieber/vim-quicktask'
Plug 'sjl/gundo.vim'
Plug 'Chiel92/vim-autoformat'
Plug 'vim-scripts/dbext.vim'
Plug 'kassio/neoterm'
Plug 'kristijanhusak/vim-carbon-now-sh'

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
" Plug 'majutsushi/tagbar'
" Plug 'sheerun/vim-polyglot'
" Plug 'tpope/vim-jdaddy'
"
" -------------------------------------
" Snippets.
" -------------------------------------
" Plug 'epilande/vim-es2015-snippets', { 'for': 'javascript' }
" Plug 'epilande/vim-react-snippets', { 'for': 'javascript' }
" Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'

call plug#end()
