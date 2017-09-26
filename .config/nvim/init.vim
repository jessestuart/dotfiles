"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Jesse does nvim.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

source $HOME/.config/nvim/base.vimrc
source $HOME/.config/nvim/files.vimrc
source $HOME/.config/nvim/plugins.vimrc
source $HOME/.config/nvim/colors.vimrc
source $HOME/.config/nvim/plugins-config.vimrc
source $HOME/.config/nvim/functions.vimrc
source $HOME/.config/nvim/etc.vimrc

" --------------------------------------
" (These lines must go at the very end of the vimrc/init.vim file)
" --------------------------------------
" Load all 'native' plugins -- these need to be added to runtime path
" before helptags can be generated.
packloadall
silent! helptags ALL
