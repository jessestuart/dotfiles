"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Jesse does nvim.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

source $HOME/.config/nvim/plugins.vimrc
source $HOME/.config/nvim/plugins-config.vimrc
source $HOME/.config/nvim/base.vimrc
source $HOME/.config/nvim/colors.vimrc
source $HOME/.config/nvim/etc.vimrc

" Return to last edit position when opening files.
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" --------------------------------------
" (These lines must go at the very end of the vimrc/init.vim file)
" --------------------------------------
" Load all plugins now.
" Plugins need to be added to runtimepath before helptags can be generated.
packloadall
" Load all of the helptags now, after plugins have been loaded.
" All messages and errors will be ignored.
silent! helptags ALL
