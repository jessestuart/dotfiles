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
" @see http://sunaku.github.io/tmux-24bit-color.html#usage
if (has('termguicolors'))
  set termguicolors
endif

function! InitializeColorscheme()
  set t_Co=256
  let s:white = { 'gui': '#ABB2BF', 'cterm': '145', 'cterm16' : '7' }
  let g:airline_powerline_fonts=1
  " let g:airline_theme='onedark'
  let g:onedark_termcolors=24
  let g:onedark_terminal_italics=1
  let g:enable_bold_font=1
  let g:onedark_terminal_italics=1
  autocmd ColorScheme * call onedark#set_highlight('Normal', { 'fg': s:white })
  highlight Comment cterm=italic
  if get(g:, 'colors_name', 'default') != 'onedark'
    let g:colors_name = 'onedark'
    try
      colorscheme onedark
    catch
    endtry
  endif
endfunction

" onedark.vim override: Don't set a background color when running in a
" terminal; just use the terminal's background color
" - `gui` is the hex color code used in GUI mode/nvim true-color mode
" - `cterm` is the color code used in 256-color mode
" - `cterm16` is the color code used in 16-color mode
if (has('autocmd') && !has('gui_running'))
  if !exists("g:colors_name")
    augroup onedark
      call InitializeColorscheme()
    augroup END
  endif
end
