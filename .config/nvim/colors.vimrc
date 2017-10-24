"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable

" Set utf8 as standard encoding.
set encoding=utf-8
set termencoding=utf-8

" Configure 24-bit (true-color) mode in Vim/Neovim when outside tmux.
" (h/t @joshdick)
" If you're using tmux version 2.2 or later, you can remove the outermost
" $TMUX check and use tmux's 24-bit color support (see link for more detail).
" @see http://sunaku.github.io/tmux-24bit-color.html#usage
if (empty($TMUX))
  if (has('nvim'))
    let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  if (has('termguicolors'))
    set termguicolors
  endif
endif

" onedark.vim override: Don't set a background color when running in a terminal;
" just use the terminal's background color
" `gui` is the hex color code used in GUI mode/nvim true-color mode
" `cterm` is the color code used in 256-color mode
" `cterm16` is the color code used in 16-color mode
if (has('autocmd') && !has('gui_running'))
  let s:white = { 'gui': '#ABB2BF', 'cterm': '145', 'cterm16' : '7' }
  autocmd ColorScheme * call onedark#set_highlight("Normal", { "fg": s:white })
end

let g:airline_powerline_fonts = 1
let g:airline_theme='onedark'
let g:onedark_termcolors=256
let g:onedark_terminal_italics=1
let g:enable_bold_font = 1
highlight Comment cterm=italic

set background=dark
try
  colorscheme onedark
catch
endtry
