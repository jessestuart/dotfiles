"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" JS things.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_flow = 1

" Don't require .jsx extension for JSX syntax highlighting.
let g:jsx_ext_required = 0

let g:tern#is_show_argument_hints_enabled = 1
let g:tern_show_argument_hints='on_hold'
let g:tern_map_keys=1
let g:deoplete#enable_at_startup = 1
let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent"]

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Silver search (`ag`) + displaying results in cope.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" When you press gv you Ag after the selected text
vnoremap <silent> gv :call VisualSelection('gv', '')<CR>
" Open Ag and put the cursor in the right position
map <leader>ag :Ag<space>
" When you press <leader>r you can search and replace the selected text
vnoremap <silent> <leader>r :call VisualSelection('replace', '')<CR>

" `cope` is a window usually used for displaying the current list of errors,
" but we can co-opt it to display search results from Ag with: <leader>cc
" To go to the next search result:       <leader>ne
" To go to the previous search result:   <leader>pe
map <leader>cc :botright cope<CR>
map <leader>co ggyG:tabnew<CR>:set syntax=qf<CR>pgg
map <leader>ne :cn<CR>
map <leader>pe :cp<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FZF
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" --column: Show column number
" --line-number: Show line number
" --no-heading: Do not show file headings in results
" --fixed-strings: Search term as a literal string
" --ignore-case: Case insensitive search
" --no-ignore: Do not respect .gitignore, etc...
" --hidden: Search hidden files and folders
" --follow: Follow symlinks
" --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
" --color: Search color options
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Markdown
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_toc_autofit = 1
let g:pandoc#modules#disabled = ['folding']
let g:pandoc#filetypes#handled = ['pandoc', 'rst', 'textile', 'markdown']

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GTM
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:gtm_plugin_status_enabled = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Miscellany
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <silent> <leader>ds <Plug>DashSearch

let g:FerretMap=0

let g:colorizer_auto_color = 1

let g:github_dashboard = {
  \ 'username': 'jessestuart',
  \ 'password': $GITHUB_PERSONAL_ACCESS_TOKEN }
let g:github_user = 'jessestuart'

let g:gutentags_file_list_command = {
  \ 'markers': {
  \   '.git': 'git ls-files',
  \ },
\ }

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

augroup asyncomplete_register_sources
  au!
  au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#omni#get_source_options({
        \ 'name': 'omni',
        \ 'whitelist': ['*'],
        \ 'blacklist': ['html', 'html.javascript'],
        \ 'completor': function('asyncomplete#sources#omni#completor')
        \  }))
  autocmd User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#necovim#get_source_options({
        \ 'name': 'necovim',
        \ 'whitelist': ['vim'],
        \ 'completor': function('asyncomplete#sources#necovim#completor'),
        \ }))
augroup END

let g:closetag_filenames = '*.html,*.php,*.jsx,*.js'
let g:user_emmet_install_global = 1

nnoremap <leader>tw :ToggleWorkspace<CR>

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)


" ==================
" Mappings for `fzy`
" ==================
function! FzyCommand(choice_command, vim_command)
  try
    let output = system(a:choice_command . " | fzy ")
  catch /Vim:Interrupt/
    " Swallow errors from ^C, allow redraw! below
  endtry
  redraw!
  if v:shell_error == 0 && !empty(output)
    exec a:vim_command . ' ' . output
  endif
endfunction
nnoremap <leader>e :call FzyCommand("find -type f", ":e")<CR>
nnoremap <leader>v :call FzyCommand("find -type f", ":vs")<CR>
nnoremap <leader>s :call FzyCommand("find -type f", ":sp")<CR>

map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)ap /  <Plug>(incsearch-forward)

let g:prettier#exec_cmd_async = 1
let g:prettier#autoformat = 1
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql, PrettierAsync
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
let g:prettier#config#trailing_comma = 'es5'
" flow|babylon|typescript|css|less|scss|json|graphql|markdown
let g:prettier#config#parser = 'flow'
" cli-override|file-override|prefer-file
let g:prettier#config#config_precedence = 'file-override'
" always|never|preserve
let g:prettier#config#prose_wrap = 'always'

let g:lightline = {
      \ 'colorscheme': 'one',
      \ 'active': {
      \ 'left':  [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'modified' ] ],
      \ 'right': [ [ 'lineinfo' ],
      \             [ 'percent' ],
      \             [ 'filetype'] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }

function! s:goyo_enter()
  set showmode
  set noshowcmd
  set scrolloff=999
  Limelight
endfunction

function! s:goyo_leave()
  set showmode
  set showcmd
  Limelight!
endfunction

" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

" Color name (:help gui-colors) or RGB color
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'

" Default: 0.5
let g:limelight_default_coefficient = 0.7

" Number of preceding/following paragraphs to include (default: 0)
let g:limelight_paragraph_span = 2

" Beginning/end of paragraph
"   When there's no empty line between the paragraphs
"   and each paragraph starts with indentation
let g:limelight_bop = '^\s'
let g:limelight_eop = '\ze\n^\s'

" Highlighting priority (default: 10)
"   Set it to -1 not to overrule hlsearch
" let g:limelight_priority = -1

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

function! s:isAtStartOfLine(mapping)
  let text_before_cursor = getline('.')[0 : col('.')-1]
  let mapping_pattern = '\V' . escape(a:mapping, '\')
  let comment_pattern = '\V' . escape(substitute(&l:commentstring, '%s.*$', '', ''), '\')
  return (text_before_cursor =~? '^' . ('\v(' . comment_pattern . '\v)?') . '\s*\v' . mapping_pattern . '\v$')
endfunction

inoreabbrev <expr> <bar><bar>
      \ <SID>isAtStartOfLine('\|\|') ?
      \ '<c-o>:TableModeEnable<cr><bar><space><bar><left><left>' : '<bar><bar>'
inoreabbrev <expr> __
      \ <SID>isAtStartOfLine('__') ?
      \ '<c-o>:silent! TableModeDisable<cr>' : '__'

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

