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

" -------------------------------------
" File management, searching, etc.
" Getting around.
" -------------------------------------
Plug 'ctrlpvim/ctrlp.vim'
Plug 'haya14busa/is.vim'
Plug 'haya14busa/vim-asterisk'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'justinmk/vim-dirvish'
Plug 'justinmk/vim-sneak'
Plug 'ludovicchabant/vim-gutentags'
Plug 'machakann/vim-highlightedyank'
Plug 'michaeljsmith/vim-indent-object'
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
Plug 'vim-ctrlspace/vim-ctrlspace'
Plug 'vim-scripts/bufexplorer.zip'
Plug 'wellle/targets.vim'
Plug 'wincent/ferret'
Plug 'yegappan/mru'

" -------------------------------------
" Pope.
" -------------------------------------
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-speeddating'

" -------------------------------------
" Git/Github-related plugins.
" -------------------------------------
Plug 'airblade/vim-gitgutter'
Plug 'codegram/vim-codereview'
Plug 'jreybert/vimagit'
Plug 'junegunn/vim-github-dashboard'
Plug 'junkblocker/patchreview-vim'
Plug 'mattn/webapi-vim' " Required for vim-github-comment
Plug 'mmozuras/vim-github-comment'

" -------------------------------------
" WebDev -- javascript, CSS, etc.
" -------------------------------------
Plug 'pangloss/vim-javascript'
Plug 'jelera/vim-javascript-syntax'
Plug 'mxw/vim-jsx'
Plug 'w0rp/ale'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'pandoc']
  \}
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
Plug 'ternjs/tern_for_vim', { 'do': 'npm install jsctags tern-coffee --save-dev' }
Plug 'othree/tern_for_vim_coffee'
Plug 'Galooshi/vim-import-js' " This may not work?
Plug 'alampros/vim-styled-jsx'
Plug 'mattn/emmet-vim'
" ----
" Place deoplete first, then autocomplete-flow
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'wokalski/autocomplete-flow'
" You will also need the following for function argument completion:
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'

" -------------------------------------
" Snippets.
" -------------------------------------
Plug 'SirVer/ultisnips'
Plug 'epilande/vim-es2015-snippets'
Plug 'epilande/vim-react-snippets'

" -------------------------------------
" Tmux-related plugins.
" -------------------------------------
Plug 'christoomey/vim-tmux-navigator' " Nav b/t tmux panes & vim splits
Plug 'edkolev/tmuxline.vim'

" -------------------------------------
" Hashicorp / Devops-related plugins.
" -------------------------------------
Plug 'hashivim/vim-packer'
Plug 'hashivim/vim-terraform'
Plug 'hashivim/vim-vagrant'
Plug 'pearofducks/ansible-vim'

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
Plug 'fatih/vim-go'
Plug 'sheerun/vim-polyglot'
Plug 'modille/groovy.vim'
Plug 'plasticboy/vim-markdown'
Plug 'alcesleo/vim-uppercase-sql'
Plug 'tpope/vim-fireplace'    " Closure
Plug 'guns/vim-sexp'          " Closure
Plug 'chrisbra/csv.vim'

" This groovy.vim ^ is the most up-to-date of the several on GitHub, with a
" number of over the messy original from `vim-scripts`.

" -------------------------------------
" Time tracking, etc.
" -------------------------------------
Plug 'git-time-metric/gtm-vim-plugin'
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
Plug 'mhinz/vim-startify'
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

Plug 'jceb/vim-orgmode'

" Figure out why this causes errors calling DeleteTrailingWhitepace() on exit.
" Plug 'kshenoy/vim-signature'

call plug#end()