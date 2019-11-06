"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" JS things.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:javascript_plugin_jsdoc = 1

" Don't require .jsx extension for JSX syntax highlighting.
" let g:jsx_ext_required = 0

" let g:tern#is_show_argument_hints_enabled = 1
" let g:tern_show_argument_hints='on_hold'
" let g:tern_map_keys=1
" let g:tern#command = ['tern']
" let g:tern#arguments = ['--persistent']

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Silver search (`ag`) + displaying results in cope.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" When you press gv you Ag after the selected text
vnoremap <silent> gv :call VisualSelection('gv', '')<CR>
" Open Ag and put the cursor in the right position
noremap <leader>ag :Ag<space><CR>
" When you press <leader>r you can search and replace the selected text
vnoremap <silent> <leader>r :call VisualSelection('replace', '')<CR>

" `cope` is a window usually used for displaying the current list of errors,
" but we can co-opt it to display search results from Ag with: <leader>cc
" To go to the next search result:       <leader>ne
" To go to the previous search result:   <leader>pe
noremap <leader>se :botright cope<CR>
noremap <leader>co ggyG :tabnew<CR>:set syntax=qf<CR>pgg
noremap <leader>ne :cn<CR>
noremap <leader>pe :cp<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup NERDTreeInit
  au!
  autocmd bufenter * if (winnr("$") == 1 &&
    \ exists("b:NERDTree") &&
    \ b:NERDTree.isTabTree()) | q | endif
  let g:NERDTreeShowHidden=1
  let g:NERDTreeIgnore=[
    \ '.git$[[dir]]',
    \ 'node_modules$[[dir]]',
    \ '.DS_Store',
    \ '*.pyc',
    \ '\~$'
    \ ]
augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Markdown
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_toc_autofit = 1
let g:pandoc#modules#disabled = ['folding', 'spell']
let g:pandoc#filetypes#handled = ['markdown', 'pandoc', 'rst', 'textile']

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GTM
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:gtm_plugin_status_enabled = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Airline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" function! AirlineInit()
"   if exists('*GTMStatusline')
"     call airline#parts#define_function('gtmstatus', 'GTMStatusline')
"     let g:airline_section_b = airline#section#create([g:airline_section_b, ' ', '[', 'gtmstatus', ']'])
"   endif
" endfunction
" autocmd User AirlineAfterInit call AirlineInit()

function! AirlineInit()
  let g:airline#extensions#coc#enabled = 1
  let g:airline_section_a = airline#section#create(['mode'])
  let g:airline_section_b = airline#section#create_left(['file'])
  let g:airline_section_c = airline#section#create(['tagbar'])
  " let g:airline_section_c = airline#section#create(['tagbar', 'gutentags'])
  " let g:airline_section_c = airline#section#create(['%{getcwd()}'])
  " let g:airline_section_x =

  call airline#util#prepend("",0)
  call airline#util#prepend(airline#extensions#tagbar#currenttag(),0)
  call airline#util#prepend(airline#extensions#vista#currenttag(),0)
  call airline#util#prepend(airline#extensions#gutentags#status(),0)
  call airline#util#prepend("",0)
  call airline#util#wrap(airline#parts#filetype(),0)

  if exists('*GTMStatusline')
    call airline#parts#define_function('gtmstatus', 'GTMStatusline')
    let g:airline_section_b = airline#section#create([g:airline_section_b, ' ', '[', 'gtmstatus', ']'])
  endif
endfunction
autocmd User AirlineAfterInit call AirlineInit()

" function! s:get_gutentags_status(mods) abort
"   let l:msg = ''
"   if index(a:mods, 'ctags') >= 0
"     let l:msg .= '♨'
"   endif
"   if index(a:mods, 'cscope') >= 0
"     let l:msg .= '♺'
"   endif
"   return l:msg
" endfunction

" set statusline+=%{gutentags#statusline_cb(
"             \function('<SID>get_gutentags_status'))}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Miscellany
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <silent> <leader>ds <Plug>DashSearch

let g:FerretMap=1

let g:colorizer_auto_color = 1
let g:colorizer_use_virtual_text=1

let g:github_dashboard = {
  \ 'username': 'jessestuart',
  \ 'password': $GITHUB_PERSONAL_ACCESS_TOKEN }
let g:github_user = 'jessestuart'

let g:gutentags_file_list_command = {
  \ 'markers': {
  \   '.git': 'git ls-files',
  \ },
\ }
let g:gutentags_cache_dir = '~/.cache/ctags/'

let g:fml_all_sources = 1

let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" augroup asyncomplete_register_sources
"   au!
"   au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#omni#get_source_options({
"         \ 'name': 'omni',
"         \ 'whitelist': ['*'],
"         \ 'blacklist': ['html', 'html.javascript'],
"         \ 'completor': function('asyncomplete#sources#omni#completor')
"         \  }))
"   autocmd User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#necovim#get_source_options({
"         \ 'name': 'necovim',
"         \ 'whitelist': ['vim'],
"         \ 'completor': function('asyncomplete#sources#necovim#completor'),
"         \ }))
" augroup END

" TODO(jesse): This was getting annoying w/ JSX; maybe reenable this?
let g:closetag_filenames = '*.html,*.jsx,*.js,*.tsx'
let g:user_emmet_install_global = 1

nnoremap <leader>tw :ToggleWorkspace<CR>

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" " ==================
" " Mappings for `fzy`
" " ==================
" function! FzyCommand(choice_command, vim_command)
"   try
"     let output = system(a:choice_command . " | fzy ")
"   catch /Vim:Interrupt/
"     " Swallow errors from ^C, allow redraw! below
"   endtry
"   redraw!
"   if v:shell_error == 0 && !empty(output)
"     exec a:vim_command . ' ' . output
"   endif
" endfunction
" nnoremap <leader>e :call FzyCommand("find -type f", ":e")<CR>
" nnoremap <leader>v :call FzyCommand("find -type f", ":vs")<CR>
" nnoremap <leader>s :call FzyCommand("find -type f", ":sp")<CR>

" =======================
" Mapping for `incsearch`
" =======================
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
set hlsearch
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)
" =======================

" ===============
" Prettier config
" ===============
let g:prettier#quickfix_auto_focus = 0
let g:prettier#exec_cmd_path = "/usr/local/bin/prettier"
let g:prettier#exec_cmd_async = 1

" when running at every change you may want to disable quickfix
let g:prettier#quickfix_enabled = 0

let g:prettier#autoformat = 0
" autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync

" augroup PrettierInit
"   autocmd!
"   autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync
"   " autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.json,*.graphql PrettierAsync
" augroup END

" max line length that prettier will wrap on
let g:prettier#config#print_width = 80
" number of spaces per indentation level
let g:prettier#config#tab_width = 2
" use tabs over spaces
let g:prettier#config#use_tabs = 'false'
" print semicolons
let g:prettier#config#semi = 'false'
" single quotes over double quotes
let g:prettier#config#single_quote = 'true'
" print spaces between brackets
let g:prettier#config#bracket_spacing = 'true'
" put > on the last line instead of new line
let g:prettier#config#jsx_bracket_same_line = 'false'
" none|es5|all
" let g:prettier#config#trailing_comma = 'all'
" flow|babel|typescript|css|less|scss|json|graphql|markdown
" let g:prettier#config#parser = 'babel'
" cli-override|file-override|prefer-file
let g:prettier#config#config_precedence = 'file-override'
" always|never|preserve
let g:prettier#config#prose_wrap = 'always'

" let g:prettier#quickfix_enabled = 1
" let g:prettier#quickfix_auto_focus = 0

" let timer = timer_start(4000, 'UpdateStatusBar',{'repeat':-1})
" function! UpdateStatusBar(timer)
"   execute 'let &ro = &ro'
" endfunction

function! s:goyo_enter()
  set showmode
  set norelativenumber
  set nonumber
  set scrolloff=999
endfunction

function! s:goyo_leave()
  set noshowmode
  set relativenumber
  set number
  set showcmd
endfunction

augroup GoyoInit
  au!
  autocmd! User GoyoEnter nested call <SID>goyo_enter()
  autocmd! User GoyoLeave nested call <SID>goyo_leave()
augroup END

" ========
" Neoterm.
" ========
let g:neoterm_automap_keys = ',tt'
let g:neoterm_default_mod = "vertical"
" Use gx{text-objects} such as gxip
nmap gx <Plug>(neoterm-repl-send)
xmap gx <Plug>(neoterm-repl-send)
nmap gxx <Plug>(neoterm-repl-send-line)
" hide/close terminal
nnoremap <silent> ,th :call neoterm#close()<cr>
" clear terminal
nnoremap <silent> ,tl :call neoterm#clear()<cr>
" kills the current job (send a <c-c>)
nnoremap <silent> ,tc :call neoterm#kill()<cr>

filetype off
let &runtimepath.=',~/.config/nvim/plugged/neoterm'
filetype plugin on

" =========
" UltiSnips
" =========
" Trigger configuration.
let g:UltiSnipsExpandTrigger='<C-e> <C-e>'
let g:UltiSnipsJumpForwardTrigger='<c-b>'
let g:UltiSnipsJumpBackwardTrigger='<c-z>'

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit='vertical'
let g:UltiSnipsListSnippets='<M-Tab>'

"
" Keep that hella legible 'conceal' option. I'm sure there's a way to do this
" built in.
" @see https://github.com/elzr/vim-json
let g:polyglot_disabled = ['json']

" Required for operations modifying multiple buffers like rename.
set hidden

" =============================================================================
" nmc2
" =============================================================================
" suppress the annoying 'match x of y', 'The only match' and 'Pattern not
" found' messages
" set shortmess+=c

" CTRL-C doesn't trigger the InsertLeave autocmd. Map to <ESC> instead.
inoremap <C-C> <ESC>

" inoremap jk <Esc>`^

" When the <Enter> key is pressed while the popup menu is visible, it only
" hides the menu. Use this mapping to close the menu and also start a new
" line.
" inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")

" Use <TAB> to select the popup menu:
" inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" let g:node_host_prog = '/usr/local/bin/neovim-node-host'

let g:ctrlp_user_command = 'git ls-files'

let g:import_sort_auto = 0

" ======================================
" From https://github.com/janko/vim-test
" ======================================
let test#strategy = 'neovim'
" let test#neovim#term_position = 'bottomleft'
let g:test#preserve_screen = 1

" nnoremap <silent> <leader>t :TestNearest<CR>
nnoremap <silent> <leader>T :TestNearest<CR>
" nnoremap <silent> <leader>a :TestSuite<CR>
nnoremap <silent> <leader>l :TestLast<CR>
" nnoremap <silent> <leader>g :TestVisit<CR>

" let g:deoplete#enable_at_startup = 1

let g:airline_powerline_fonts=1
let g:airline_theme='onedark'

let g:airline#extensions#tabline#tab_min_count = 2
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#show_splits = 1
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline#extensions#tabline#show_tab_type = 0
" let g:airline#extensions#tabline#show_close_button = 0

let g:airline#extensions#bufferline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1

let g:multi_cursor_exit_from_insert_mode = 0

let g:javascript_conceal_function             = "ƒ"
let g:javascript_conceal_null                 = "ø"
let g:javascript_conceal_this                 = "@"
let g:javascript_conceal_return               = "⇚"
let g:javascript_conceal_undefined            = "¿"
let g:javascript_conceal_NaN                  = "ℕ"
let g:javascript_conceal_prototype            = "¶"
let g:javascript_conceal_static               = "•"
let g:javascript_conceal_super                = "Ω"
let g:javascript_conceal_arrow_function       = "⇒"

" set runtimepath+=~/.config/nvim/plugged/LanguageClient-neovim

let g:vim_package_info_virutaltext_prefix = '  ¤ '
let g:vim_package_info_virutaltext_highlight = 'NonText'

" Run jest for current project
command! -nargs=0 Jest :call  CocAction('runCommand', 'jest.projectTest')
" Run jest for current file
command! -nargs=0 JestCurrent :call  CocAction('runCommand', 'jest.fileTest', ['%'])
" Run jest for current test
nnoremap <leader>te :call CocAction('runCommand', 'jest.singleTest')<CR>
" Init jest in current cwd, require global jest command exists
command! JestInit :call CocAction('runCommand', 'jest.init')

" set statusline+=%{gutentags#statusline()}

" ===================
" vimcmdline mappings
" ===================
let cmdline_map_start          = '<LocalLeader>c'
let cmdline_map_send           = '<LocalLeader>cS'
" let cmdline_map_send_and_stay  = '<LocalLeader><Space>'
let cmdline_map_source_fun     = '<LocalLeader>cf'
let cmdline_map_send_paragraph = '<LocalLeader>cp'
let cmdline_map_send_block     = '<LocalLeader>cb'
let cmdline_map_quit           = '<LocalLeader>cq'

" ==================
" vimcmdline options
" ==================
let cmdline_vsplit      = 1      " Split the window vertically
let cmdline_esc_term    = 1      " Remap <Esc> to :stopinsert in Neovim's terminal
let cmdline_in_buffer   = 1      " Start the interpreter in a Neovim's terminal
let cmdline_term_height = 15     " Initial height of interpreter window or pane
let cmdline_term_width  = 80     " Initial width of interpreter window or pane
let cmdline_tmp_dir     = '/tmp' " Temporary directory to save files
let cmdline_outhl       = 1      " Syntax highlight the output
" let cmdline_auto_scroll = 1      " Keep the cursor at the end of terminal (nvim)
