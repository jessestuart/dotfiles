call plug#begin()
" -------------------------------------
" File management, searching, etc.
" Getting around.
" -------------------------------------
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
Plug 'vim-scripts/bufexplorer.zip'
Plug 'wincent/ferret'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'yegappan/mru'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'haya14busa/is.vim'
Plug 'haya14busa/vim-asterisk'
Plug 'michaeljsmith/vim-indent-object'
Plug 'justinmk/vim-sneak'
Plug 'justinmk/vim-dirvish'
Plug 'vim-ctrlspace/vim-ctrlspace'

" -------------------------------------
" Text Editing.
" -------------------------------------
Plug 'tommcdo/vim-exchange'
Plug 'reedes/vim-pencil'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'

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
" Javascript / Node / etc. development.
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
" ----
" Place deoplete first, then autocomplete-flow
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'wokalski/autocomplete-flow'
" You will also need the following for function argument completion:
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'Galooshi/vim-import-js' " This may not work?
Plug 'othree/tern_for_vim_coffee'

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
Plug 'KeitaNakamura/neodark.vim'

" -------------------------------------
" Misc. language support.
" -------------------------------------
Plug 'fatih/vim-go'
Plug 'sheerun/vim-polyglot'
Plug 'modille/groovy.vim'
Plug 'plasticboy/vim-markdown'
Plug 'tpope/vim-fireplace'    " Closure
Plug 'guns/vim-sexp'          " Closure

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
" Catch all. TODO: Organize these.
" -------------------------------------
" Plug 'benmills/vimux'
Plug 'easymotion/vim-easymotion'
Plug 'ervandew/supertab'
Plug 'godlygeek/tabular'
Plug 'junegunn/vim-peekaboo'
" Plug 'mhinz/vim-startify'
Plug 'Shougo/denite.nvim'
Plug 'sjl/splice.vim'
Plug 'wellle/targets.vim'
" Plug 'meister/vim-snazzyfied'
Plug 'rizzatti/dash.vim'
Plug 'machakann/vim-highlightedyank'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdcommenter'
Plug 'vimwiki/vimwiki'
" Plug 'kshenoy/vim-signature'
" Plug 'chriskempson/base16-vim'
Plug 'fmoralesc/vim-tutor-mode'
Plug 'mattn/emmet-vim'
Plug 'aaronbieber/vim-quicktask'
Plug 'chrisbra/Colorizer'
Plug 'ludovicchabant/vim-gutentags'
Plug 'sunaku/vim-shortcut'
Plug 'alampros/vim-styled-jsx'
Plug 'ktonga/vim-follow-my-lead'


Plug 'Shougo/neco-vim'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'yami-beta/asyncomplete-omni.vim'
Plug 'prabirshrestha/asyncomplete-flow.vim'
Plug 'prabirshrestha/asyncomplete-necovim.vim'
Plug 'alcesleo/vim-uppercase-sql'
Plug 'wesQ3/vim-windowswap'
Plug 'alvan/vim-closetag'
Plug 'jiangmiao/auto-pairs'
Plug 'thaerkh/vim-workspace'

call plug#end()
