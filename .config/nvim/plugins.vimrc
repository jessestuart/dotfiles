call plug#begin()
" -------------------------------------
" Pope.
" -------------------------------------
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-repeat'
" -------------------------------------
" Git/Github-related plugins.
" -------------------------------------
Plug 'junegunn/vim-github-dashboard'
Plug 'mattn/webapi-vim' " Required for vim-github-comment
Plug 'junkblocker/patchreview-vim'
Plug 'codegram/vim-codereview'
Plug 'mmozuras/vim-github-comment'

" -------------------------------------
" Clojure-related plugins.
" -------------------------------------
Plug 'tpope/vim-fireplace'
Plug 'guns/vim-sexp'

" -------------------------------------
" -------------------------------------
Plug 'airblade/vim-gitgutter'
" Plug 'benmills/vimux'
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
Plug 'christoomey/vim-tmux-navigator' " Nav b/t tmux panes & vim splits
" Plug 'craigemery/vim-autotag'
Plug 'easymotion/vim-easymotion'
Plug 'ervandew/supertab'
Plug 'fatih/vim-go'
" Plug 'godlygeek/tabular'
Plug 'hashivim/vim-packer'
Plug 'hashivim/vim-terraform'
Plug 'hashivim/vim-vagrant'
Plug 'joshdick/onedark.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/vim-peekaboo'
Plug 'justinmk/vim-sneak'
" Plug 'mhinz/vim-startify'
Plug 'pearofducks/ansible-vim'
Plug 'plasticboy/vim-markdown'
Plug 'modille/groovy.vim'
" Plug 'rdolgushin/groovy.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
Plug 'sheerun/vim-polyglot'
Plug 'Shougo/denite.nvim'
Plug 'shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'sjl/splice.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-scripts/bufexplorer.zip'
Plug 'wakatime/vim-wakatime'
Plug 'wellle/targets.vim'
Plug 'wincent/command-t', {
  \   'do': 'cd ruby/command-t/ext/command-t && ruby extconf.rb && make'
  \ }
Plug 'wincent/ferret'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'yegappan/mru'
" Plug 'meister/vim-snazzyfied'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql']
  \}
Plug 'git-time-metric/gtm-vim-plugin'
Plug 'rizzatti/dash.vim'
Plug 'machakann/vim-highlightedyank'
Plug 'ternjs/tern_for_vim', { 'do': 'npm install tern-coffee --save-dev' }
Plug 'othree/tern_for_vim_coffee'
" Plug 'Galooshi/vim-import-js'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdcommenter'
" Plug 'yuttie/comfortable-motion.vim'
" Plug 'reedes/vim-pencil'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'jreybert/vimagit'
Plug 'vimwiki/vimwiki'
" Plug 'kshenoy/vim-signature'
" Plug 'chriskempson/base16-vim'
Plug 'fmoralesc/vim-tutor-mode'
Plug 'mattn/emmet-vim'
Plug 'edkolev/tmuxline.vim'
Plug 'aaronbieber/vim-quicktask'
Plug 'chrisbra/Colorizer'

call plug#end()
