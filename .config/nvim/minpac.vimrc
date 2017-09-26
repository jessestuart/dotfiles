packadd minpac
call minpac#init()

call minpac#add('k-takata/minpac', { 'type': 'opt' })

call minpac#add('machakann/vim-highlightedyank')
call minpac#add('tpope/vim-commentary')
call minpac#add('tpope/vim-endwise')
call minpac#add('tpope/vim-fugitive')
call minpac#add('tpope/vim-surround')
call minpac#add('tpope/vim-unimpaired')
call minpac#add('tpope/vim-repeat')
call minpac#add('airblade/vim-gitgutter')
" call minpac#add('benmills/vimux')
call minpac#add('christoomey/vim-tmux-navigator') " Nav b/t tmux panes & vim splits
call minpac#add('craigemery/vim-autotag')
call minpac#add('easymotion/vim-easymotion')
call minpac#add('ervandew/supertab')
call minpac#add('godlygeek/tabular')
call minpac#add('fatih/vim-go')
call minpac#add('hashivim/vim-packer')
call minpac#add('hashivim/vim-terraform')
call minpac#add('hashivim/vim-vagrant')
call minpac#add('joshdick/onedark.vim')
" call minpac#add('junegunn/fzf')
call minpac#add('junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' })
call minpac#add('junegunn/goyo.vim')
call minpac#add('junegunn/vim-peekaboo')
call minpac#add('justinmk/vim-sneak')
" call minpac#add('mhinz/vim-startify')
call minpac#add('pearofducks/ansible-vim')
call minpac#add('plasticboy/vim-markdown')
call minpac#add('rdolgushin/groovy.vim')
call minpac#add('rking/ag.vim')
call minpac#add('ryanoasis/vim-devicons')
call minpac#add('scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] })
call minpac#add('sheerun/vim-polyglot')
" call minpac#add('Shougo/denite.nvim')
call minpac#add('shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' })
call minpac#add('sjl/splice.vim')
call minpac#add('vim-airline/vim-airline')
call minpac#add('vim-scripts/bufexplorer.zip')
call minpac#add('wakatime/vim-wakatime')
call minpac#add('wellle/targets.vim')
call minpac#add('wincent/command-t')
call minpac#add('wincent/ferret')
call minpac#add('Xuyuanp/nerdtree-git-plugin')
call minpac#add('yegappan/mru')
call minpac#add('ctrlpvim/ctrlp.vim')
" call minpac#add('meister/vim-snazzyfied')
call minpac#add('git-time-metric/gtm-vim-plugin')
call minpac#add('rizzatti/dash.vim')
call minpac#add('machakann/vim-highlightedyank')
call minpac#add('carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' })
call minpac#add('ternjs/tern_for_vim', { 'do': 'npm install tern-coffee --save-dev' })
call minpac#add('othree/tern_for_vim_coffee')
call minpac#add('Galooshi/vim-import-js')
" call minpac#add('majutsushi/tagbar')
call minpac#add('scrooloose/nerdcommenter')
call minpac#add('yuttie/comfortable-motion.vim')
call minpac#add('reedes/vim-pencil')
call minpac#add('vim-pandoc/vim-pandoc')
call minpac#add('vim-pandoc/vim-pandoc-syntax')
call minpac#add('jreybert/vimagit')
call minpac#add('vimwiki/vimwiki')
" call minpac#add('kshenoy/vim-signature')



command! PackUpdate   call minpac#update()
command! PackClean    call minpac#clean()

" Load the plugins right now. (optional)
packloadall
