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
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/vim-easy-align'
Plug 'osyo-manga/vim-over'
" Plug 'reedes/vim-pencil'
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
" Plug 'tpope/vim-projectionist'

" -------------------------------------
" Git/Github-related plugins.
" -------------------------------------
Plug 'airblade/vim-gitgutter'
Plug 'jreybert/vimagit'
" Plug 'codegram/vim-codereview'
" Plug 'junegunn/vim-github-dashboard', { 'on': ['GHDashboard', 'GHActivity'] }
" Plug 'junkblocker/patchreview-vim'
" Plug 'mattn/webapi-vim' " Required for vim-github-comment
" Plug 'mmozuras/vim-github-comment'
" Plug 'idanarye/vim-merginal'
Plug 'cohama/agit.vim'

" -------------------------------------
" WebDev.
" -------------------------------------
Plug 'pangloss/vim-javascript'
" Plug 'mxw/vim-jsx'
Plug 'othree/yajs.vim'
Plug 'prettier/vim-prettier', {
      \ 'do': 'yarn install',
      \ 'for': ['javascript', 'typescript', 'css',
      \         'less', 'scss', 'json', 'graphql', 'markdown', 'vue',
      \         'javascript.jsx', 'typescript.tsx', 'yaml', 'pandoc',
      \]}
Plug 'chrisbra/Colorizer'
Plug 'Galooshi/vim-import-js', { 'do': 'yarn install' }
Plug 'heavenshell/vim-jsdoc'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
" Plug 'alampros/vim-styled-jsx'
" Plug 'jxnblk/vim-mdx-js'
Plug 'othree/javascript-libraries-syntax.vim'
" Plug 'mattn/emmet-vim'
Plug 'moll/vim-node'

" Disabled 20181114
Plug 'ternjs/tern_for_vim', { 'do': 'npm install jsctags --save-dev' }
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }

" For Denite features
Plug 'Shougo/denite.nvim'

" ==========
" Typescript
" ==========

" Plug 'leafgarland/typescript-vim', { 'for': ['typescript', 'typescript.tsx'] }
" Plug 'HerringtonDarkholme/yats.vim', { 'for': ['typescript', 'typescript.tsx'] }
" Plug 'Quramy/tsuquyomi', { 'for': ['typescript', 'typescript.tsx'] }

Plug 'jason0x43/vim-js-indent', { 'for': ['typescript', 'typescript.tsx'] }
Plug 'peitalin/vim-jsx-typescript', { 'for': ['typescript', 'typescript.tsx'] }
Plug 'Quramy/vim-js-pretty-template', { 'for': ['typescript', 'typescript.tsx'] }

" Plug 'mhartington/nvim-typescript', {'do': './install.sh'}

" -------------------------------------
" Tmux-related plugins.
" -------------------------------------
Plug 'christoomey/vim-tmux-navigator' " Nav b/t tmux panes & vim splits
Plug 'tmux-plugins/vim-tmux' " *Much* better syntax highlighting in tmux.conf.

" -------------------------------------
" Hashicorp / Devops-related plugins.
" -------------------------------------
" Plug 'hashivim/vim-packer'
" Plug 'hashivim/vim-terraform'
" Plug 'hashivim/vim-vagrant'
Plug 'pearofducks/ansible-vim'
" Plug 'hejack0207/ansible.vim'

" -------------------------------------
" Visual styling / theming.
" -------------------------------------
Plug 'joshdick/onedark.vim'
" Plug 'rakr/vim-one'
Plug 'junegunn/goyo.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
" Plug 'itchyny/lightline.vim'

" -------------------------------------
" Misc. language support.
" -------------------------------------
Plug 'sheerun/vim-polyglot'
" Plug 'ekalinin/Dockerfile.vim'
Plug 'moby/moby' , {'rtp': '/contrib/syntax/vim/'}
" Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'alcesleo/vim-uppercase-sql', { 'for': 'sql' }
Plug 'jparise/vim-graphql'
" Plug 'modille/groovy.vim', { 'for': ['groovy', 'Jenkinsfile'] } " See note [1] below.
" Plug 'neovimhaskell/haskell-vim'
" Plug 'jaspervdj/stylish-haskell'

" [1]: This groovy.vim ^ is the most up-to-date of the several on GitHub, with
" a number of improvements over the messy original from `vim-scripts`.

" ========================
" Autocomplete / Snippets.
" ========================
Plug 'SirVer/ultisnips'
" Plug 'epilande/vim-es2015-snippets', { 'for': 'javascript' }
" Plug 'epilande/vim-react-snippets', { 'for': 'javascript' }
" Plug 'honza/vim-snippets'
" Plug 'phenomenes/ansible-snippets', { 'for': ['ansible', 'yaml', 'yml'] }

" Place deoplete first, then autocomplete-flow
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'Shougo/neocomplete'
" Plug 'Shougo/neco-vim'
" Syntax source for neocomplete/deoplete/ncm
" Plug 'Shougo/neco-syntax'

Plug 'autozimu/LanguageClient-neovim', {
      \ 'branch': 'next',
      \ 'do': 'bash install.sh',
      \ }

" Plug 'wokalski/autocomplete-flow'
" You will also need the following for function argument completion:
" Plug 'Shougo/neosnippet'
" Plug 'Shougo/neosnippet-snippets'

" Plug 'flowtype/vim-flow'

" -------------------------------------
" Time tracking, etc.
" -------------------------------------
if executable('gtm')
  Plug 'git-time-metric/gtm-vim-plugin'
endif
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
Plug 'rizzatti/dash.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'aaronbieber/vim-quicktask'
Plug 'sunaku/vim-shortcut'
Plug 'ktonga/vim-follow-my-lead'
Plug 'wesQ3/vim-windowswap'
Plug 'thaerkh/vim-workspace'
Plug 'janko-m/vim-test'
Plug 'zivyangll/git-blame.vim'

Plug 'jceb/vim-orgmode'
Plug 'sjl/gundo.vim'
" Plug 'Chiel92/vim-autoformat'
" Plug 'vim-scripts/dbext.vim'
" Plug 'kassio/neoterm'
Plug 'kristijanhusak/vim-carbon-now-sh'
Plug 'majutsushi/tagbar'
" Plug 'rhysd/clever-f.vim'
Plug 'gregsexton/gitv'

" Plug 'jpalardy/vim-slime'

" Plug 'eraserhd/parinfer-rust'

" Plug 'sbdchd/neoformat'

Plug 'jaawerth/nrun.vim'

Plug 'jessestuart/vim-markdown-link-convert'

" Plug 'jordwalke/vim-reasonml'
" Plug 'reasonml-editor/vim-reason-plus'

Plug 'srstevenson/vim-topiary'

Plug 'chrisbra/matchit'

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
" Plug 'fmoralesc/vim-tutor-mode'
" Plug 'tpope/vim-jdaddy'
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

" Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}
" Plug 'neoclide/coc.nvim', {'do': 'yarn install'}

Plug 'google/vim-jsonnet'

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

" Plug 'meain/vim-package-json', { 'do': 'cd rplugin/node/vim-package-json && yarn -s' }

call plug#end()
