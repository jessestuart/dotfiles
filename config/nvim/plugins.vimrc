call plug#begin()
" -------------------------------------
" Text Editing.
" -------------------------------------
Plug 'alvan/vim-closetag'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/vim-easy-align'
Plug 'reedes/vim-pencil'
Plug 'tommcdo/vim-exchange'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'osyo-manga/vim-over'
Plug 'christoomey/vim-sort-motion'

" Plug 'andymass/vim-matchup'
" Plug 'tmhedberg/matchit'

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

" -------------------------------------
" WebDev -- javascript, CSS, etc.
" -------------------------------------
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'jelera/vim-javascript-syntax', { 'for': 'javascript' }
Plug 'mxw/vim-jsx', { 'for': 'javascript' }
Plug 'w0rp/ale'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
" Plug 'prettier/vim-prettier',
"       \{ 'do': 'yarn install',
"       \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'pandoc']
"       \}
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern', 'for': 'javascript' }
Plug 'ternjs/tern_for_vim', { 'do': 'npm install jsctags --save-dev', 'for': 'javascript' }
Plug 'Galooshi/vim-import-js', { 'for': 'javascript' } " This may not work?
Plug 'alampros/vim-styled-jsx', { 'for': 'javascript' }
Plug 'mattn/emmet-vim'
" ----
" Place deoplete first, then autocomplete-flow
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'wokalski/autocomplete-flow', { 'for': 'javascript' }
" You will also need the following for function argument completion:
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'

" ==========
" Typescript
" ==========
Plug 'Quramy/tsuquyomi'
Plug 'leafgarland/typescript-vim'

" -------------------------------------
" Snippets.
" -------------------------------------
Plug 'epilande/vim-es2015-snippets', { 'for': 'javascript' }
Plug 'epilande/vim-react-snippets', { 'for': 'javascript' }
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'

" -------------------------------------
" Tmux-related plugins.
" -------------------------------------
Plug 'christoomey/vim-tmux-navigator' " Nav b/t tmux panes & vim splits
Plug 'tmux-plugins/vim-tmux' " *Much* better syntax highlighting in tmux.conf.
" Plug 'edkolev/tmuxline.vim'

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
Plug 'vim-airline/vim-airline'
Plug 'joshdick/onedark.vim'
Plug 'rakr/vim-one'
Plug 'KeitaNakamura/neodark.vim'

" -------------------------------------
" Misc. language support.
" -------------------------------------
Plug 'alcesleo/vim-uppercase-sql', { 'for': 'sql' }
Plug 'chrisbra/csv.vim', { 'for': 'csv' }
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'modille/groovy.vim', { 'for': 'groovy' }
Plug 'plasticboy/vim-markdown'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-jdaddy'

" This groovy.vim ^ is the most up-to-date of the several on GitHub, with a
" number of over the messy original from `vim-scripts`.

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
Plug 'Shougo/denite.nvim'
Plug 'sjl/splice.vim'
Plug 'rizzatti/dash.vim'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdcommenter'
Plug 'vimwiki/vimwiki'
Plug 'fmoralesc/vim-tutor-mode'
Plug 'aaronbieber/vim-quicktask'
Plug 'chrisbra/Colorizer'
Plug 'sunaku/vim-shortcut'
Plug 'ktonga/vim-follow-my-lead'

Plug 'Shougo/neco-vim'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'yami-beta/asyncomplete-omni.vim'
Plug 'prabirshrestha/asyncomplete-flow.vim'
Plug 'prabirshrestha/asyncomplete-necovim.vim'
Plug 'wesQ3/vim-windowswap'
Plug 'thaerkh/vim-workspace'
Plug 'maralla/completor.vim'
Plug 'janko-m/vim-test'

Plug 'jceb/vim-orgmode'
Plug 'aaronbieber/vim-quicktask'

" Figure out why this causes errors calling DeleteTrailingWhitepace() on exit.
" Plug 'kshenoy/vim-signature'

call plug#end()
