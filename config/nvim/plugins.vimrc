" =================================================
" Functions to help enable lazy-loading of plugins.
" @see https://www.reddit.com/r/vim/comments/7datnj/vimplug_cursorhold_and_ondemand_loading/
" =================================================
call plug#begin()
" -------------------------------------
" Text Editing.
" -------------------------------------
Plug 'alvan/vim-closetag'
Plug 'christoomey/vim-sort-motion'
" Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/vim-easy-align'
Plug 'osyo-manga/vim-over'
Plug 'tommcdo/vim-exchange'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'jessestuart/vim-markdown-link-convert'
" Plug 'reedes/vim-pencil'

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
" Plug 'haya14busa/is.vim' " Doesn't seem to work compared to `incsearch`...?
Plug 'haya14busa/vim-asterisk'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'justinmk/vim-dirvish'
Plug 'justinmk/vim-sneak'
Plug 'machakann/vim-highlightedyank'
Plug 'michaeljsmith/vim-indent-object'
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
Plug 'wincent/ferret'

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
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-dotenv'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-projectionist'

" Mappings for working with JSON in Vim:
" - `aj` provides a text object for the outermost JSON object, array, string,
"   number, or keyword.
" - `gqaj` pretty prints (wraps/indents/sorts keys/otherwise cleans up) the
"   JSON construct under the cursor.
" - `gwaj` takes the JSON object on the clipboard and extends it into the JSON
"   object under the cursor.
" There are also `ij` variants that target innermost rather than outermost JSON
" construct."
Plug 'tpope/vim-jdaddy'

" -------------------------------------
" Git/Github-related plugins.
" -------------------------------------
" Plug 'airblade/vim-gitgutter'
Plug 'cohama/agit.vim'
Plug 'gregsexton/gitv'
Plug 'jreybert/vimagit'
Plug 'zivyangll/git-blame.vim'
Plug 'junegunn/vim-github-dashboard', { 'on': ['GHDashboard', 'GHActivity'] }
" Plug 'codegram/vim-codereview'
" Plug 'junkblocker/patchreview-vim'
" Plug 'mattn/webapi-vim' " Required for vim-github-comment
" Plug 'mmozuras/vim-github-comment'
" Plug 'idanarye/vim-merginal'

" -------------------------------------
" WebDev.
" -------------------------------------
" Plug 'jessestuart/vim-prettier', { 'do': 'yarn install', }
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'chrisbra/Colorizer'
Plug 'Galooshi/vim-import-js', { 'do': 'yarn install' }
Plug 'heavenshell/vim-jsdoc'
Plug 'styled-components/vim-styled-components', { 'branch': 'develop' }
Plug 'alampros/vim-styled-jsx'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'moll/vim-node'
Plug 'hail2u/vim-css3-syntax'
" Plug 'othree/yajs.vim'
" Plug 'mxw/vim-jsx'
" Plug 'mattn/emmet-vim'
Plug 'jxnblk/vim-mdx-js'
Plug 'pangloss/vim-javascript'
Plug 'gutenye/json5.vim'

Plug 'Shougo/echodoc.vim'

" Plug 'ternjs/tern_for_vim', { 'do': 'npm install jsctags --save-dev' }
" Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" For Denite features
Plug 'Shougo/denite.nvim'

" ==========
" Typescript
" ==========
" Plug 'leafgarland/typescript-vim', { 'for': ['typescript', 'typescript.tsx'] }
Plug 'HerringtonDarkholme/yats.vim', { 'for': ['typescript', 'typescript.tsx'] }
" Plug 'mhartington/nvim-typescript', { 'build': './install.sh' }
Plug 'Quramy/tsuquyomi', { 'for': ['typescript', 'typescript.tsx'] }
Plug 'Quramy/vim-js-pretty-template', { 'for': ['typescript', 'typescript.tsx'] }
" Plug 'Shougo/vimproc.vim', { 'do': 'make' }

Plug 'jason0x43/vim-js-indent', { 'for': ['typescript', 'typescript.tsx'] }
Plug 'peitalin/vim-jsx-typescript', { 'for': ['typescript', 'typescript.tsx'] }

if executable('node')
  Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
  Plug 'neoclide/jsonc.vim'
endif

Plug 'Shougo/neco-vim'
Plug 'neoclide/coc-neco'

" -------------------------------------
" Tmux-related plugins.
" -------------------------------------
Plug 'christoomey/vim-tmux-navigator' " Nav b/t tmux panes & vim splits
Plug 'tmux-plugins/vim-tmux' " *Much* better syntax highlighting in tmux.conf.

" -------------------------------------
" Hashicorp / Devops-related plugins.
" -------------------------------------
Plug 'pearofducks/ansible-vim'
Plug 'hashivim/vim-terraform'
Plug 'hashivim/vim-packer'
" Plug 'hashivim/vim-vagrant'

" -------------------------------------
" Visual styling / theming.
" -------------------------------------
Plug 'joshdick/onedark.vim'
Plug 'junegunn/goyo.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Plug 'itchyny/lightline.vim'

" -------------------------------------
" Misc. language support.
" -------------------------------------
Plug 'sheerun/vim-polyglot'
Plug 'moby/moby' , {'rtp': '/contrib/syntax/vim/'}
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'alcesleo/vim-uppercase-sql', { 'for': 'sql' }
Plug 'jparise/vim-graphql'
Plug 'modille/groovy.vim', { 'for': ['groovy', 'Jenkinsfile'] } " See note [1] below.
Plug 'martinda/Jenkinsfile-vim-syntax'
" Plug 'neovimhaskell/haskell-vim'
" Plug 'jaspervdj/stylish-haskell'

" ========================
" Autocomplete / Snippets.
" ========================
Plug 'SirVer/ultisnips'
Plug 'epilande/vim-es2015-snippets', { 'for': 'javascript' }
Plug 'epilande/vim-react-snippets'
Plug 'phenomenes/ansible-snippets', { 'for': ['ansible', 'yaml', 'yml'] }
" Plug 'honza/vim-snippets'

" Place deoplete first, then autocomplete-flow
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'Shougo/neocomplete'
" Plug 'Shougo/neco-vim'
" Syntax source for neocomplete/deoplete/ncm
" Plug 'Shougo/neco-syntax'

" ============================
" LanguageClient (LSP) support
" ============================
" Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh' }

" -------------------------------------
" Time tracking, etc.
" -------------------------------------
if executable('gtm')
  Plug 'git-time-metric/gtm-vim-plugin'
endif
if executable('wakatime')
  Plug 'wakatime/vim-wakatime'
endif

" -------------------------------------
" Kubernetes, etc.
" -------------------------------------
Plug 'mustache/vim-mustache-handlebars'
Plug 'andrewstuart/vim-kubernetes'
Plug 'c9s/vikube.vim'

" -------------------------------------
" Experimentation. Inbox.
Plug 'easymotion/vim-easymotion'
" Plug 'ervandew/supertab'
Plug 'godlygeek/tabular'
Plug 'vimwiki/vimwiki'
Plug 'junegunn/vim-peekaboo'
Plug 'sjl/splice.vim'
Plug 'rizzatti/dash.vim'
" Plug 'scrooloose/nerdcommenter'
Plug 'sunaku/vim-shortcut'
Plug 'ktonga/vim-follow-my-lead'
Plug 'wesQ3/vim-windowswap'
Plug 'thaerkh/vim-workspace'
Plug 'janko-m/vim-test'

Plug 'jceb/vim-orgmode'
Plug 'kristijanhusak/vim-carbon-now-sh'
Plug 'majutsushi/tagbar'
Plug 'liuchengxu/vista.vim'
Plug 'sjl/gundo.vim'
" Plug 'Chiel92/vim-autoformat'
" Plug 'eraserhd/parinfer-rust'
" Plug 'jpalardy/vim-slime'
Plug 'kassio/neoterm'
" Plug 'rhysd/clever-f.vim'
" Plug 'sbdchd/neoformat'
" Plug 'vim-scripts/dbext.vim'

Plug 'jaawerth/nrun.vim'

" Plug 'jordwalke/vim-reasonml'
" Plug 'reasonml-editor/vim-reason-plus'

Plug 'srstevenson/vim-topiary'

Plug 'chrisbra/matchit'

" Figure out why this causes errors calling DeleteTrailingWhitepace() on exit.
" Plug 'kshenoy/vim-signature'

Plug 'google/vim-jsonnet'
Plug 'google/vim-searchindex'

" ES2015 code snippets
Plug 'epilande/vim-es2015-snippets'
" React code snippets (Optional)
Plug 'epilande/vim-react-snippets'
Plug 'honza/vim-snippets'

" > This plugin sends lines from either Vim or Neovim to a command line
" > interpreter (REPL application). There is support for Clojure, Golang,
" > Haskell, JavaScript, Julia, Jupyter, Lisp, Macaulay2, Matlab, Prolog,
" > Python, Ruby, Sage, Scala, Shell script, and Swift (see Nvim-R for R support
" > on Vim/Neovim). The interpreter may run in a Neovim built-in terminal
" > (Neovim buffer), an external terminal emulator or in a tmux pane.
Plug 'jalvesaq/vimcmdline'

Plug 'meain/vim-package-info', { 'do': 'yarn -s' }

Plug 'kristijanhusak/vim-carbon-now-sh'
Plug 'christoomey/vim-conflicted'

Plug 'robbles/logstash.vim'
Plug 'towolf/vim-helm'

Plug 'MattesGroeger/vim-bookmarks'

" Plug 'vim-ctrlspace/vim-ctrlspace'

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
" Plug 'fmoralesc/vim-tutor-mode'
" Plug 'chrisbra/csv.vim', { 'for': 'csv' }
" Plug 'plasticboy/vim-markdown'

" ========
" ncm2
" ========
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
" Plug 'ncm2/ncm2-tern', { 'do': 'yarn install' }

" Plug 'paretje/nvim-man'
" Plug 'vim-utils/vim-man'

Plug 'ruanyl/coverage.vim'
Plug 'mcchrish/nnn.vim'
Plug 'glacambre/firenvim', { 'do': function('firenvim#install') }
Plug 'hjson/vim-hjson'

call plug#end()
