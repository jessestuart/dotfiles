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
Plug 'tpope/vim-rhubarb'

" -------------------------------------
" Git/Github-related plugins.
" -------------------------------------
Plug 'airblade/vim-gitgutter'
Plug 'codegram/vim-codereview'
Plug 'git-time-metric/gtm-vim-plugin'
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
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
Plug 'ternjs/tern_for_vim', { 'do': 'npm install jsctags tern-coffee --save-dev' }
Plug 'w0rp/ale'
" ----
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql']
  \}
Plug 'Galooshi/vim-import-js' " This may not work?
Plug 'othree/tern_for_vim_coffee'

" -------------------------------------
" Clojure-related plugins.
" -------------------------------------
Plug 'tpope/vim-fireplace'
Plug 'guns/vim-sexp'

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
" File management, searching, etc.
" -------------------------------------
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
Plug 'sheerun/vim-polyglot'
Plug 'vim-scripts/bufexplorer.zip'
Plug 'wincent/command-t', {
  \   'do': 'cd ruby/command-t/ext/command-t && ruby extconf.rb && make'
  \ }
Plug 'wincent/ferret'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'yegappan/mru'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'haya14busa/is.vim'
Plug 'haya14busa/vim-asterisk'
Plug 'michaeljsmith/vim-indent-object'

" -------------------------------------
" Misc. language support.
" -------------------------------------
Plug 'fatih/vim-go'
Plug 'plasticboy/vim-markdown'
Plug 'modille/groovy.vim'
" Plug 'rdolgushin/groovy.vim'

" -------------------------------------
" Catch all. TODO: Organize these.
" -------------------------------------
" Plug 'benmills/vimux'
Plug 'craigemery/vim-autotag'
Plug 'easymotion/vim-easymotion'
Plug 'ervandew/supertab'
" Plug 'godlygeek/tabular'
Plug 'junegunn/vim-peekaboo'
Plug 'justinmk/vim-sneak'
" Plug 'mhinz/vim-startify'
Plug 'Shougo/denite.nvim'
Plug 'sjl/splice.vim'
Plug 'wakatime/vim-wakatime'
Plug 'wellle/targets.vim'
" Plug 'meister/vim-snazzyfied'
Plug 'rizzatti/dash.vim'
Plug 'machakann/vim-highlightedyank'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdcommenter'
" Plug 'yuttie/comfortable-motion.vim'
" Plug 'reedes/vim-pencil'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'vimwiki/vimwiki'
" Plug 'kshenoy/vim-signature'
" Plug 'chriskempson/base16-vim'
Plug 'fmoralesc/vim-tutor-mode'
Plug 'mattn/emmet-vim'
Plug 'aaronbieber/vim-quicktask'
Plug 'chrisbra/Colorizer'
Plug 'ludovicchabant/vim-gutentags'
Plug 'sunaku/vim-shortcut'

call plug#end()
