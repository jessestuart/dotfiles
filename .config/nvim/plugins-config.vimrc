"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Asynchronous Lint Engine (ALE), and other JS things.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ale_javascript_eslint_options = 'esversion: 6'
let g:ale_javascript_prettier_use_global = 1
let g:ale_linters = {
\   'javascript': ['eslint', 'flow'],
\}
" :ALEFix will attempt to fix your JS code using ESLint.
let g:ale_fixers = {
\   'javascript': ['eslint', 'prettier'],
\}
" Fix files automatically on save. (This is off by default)
nnoremap <leader>gaf :ALEFix<cr>
" let g:ale_fix_on_save = 1

let g:ale_sign_error = 'X'
let g:ale_sign_warning = '?'
let g:ale_statusline_format = ['X %d', '? %d', '']
" %linter% is the name of the linter that provided the message
" %s is the error or warning message
let g:ale_echo_msg_format = '%linter%: %s'
" Map keys to navigate between lines with errors and warnings.
nnoremap <leader>an :ALENextWrap<cr>
nnoremap <leader>ap :ALEPreviousWrap<cr>

let g:javascript_plugin_jsdoc = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Deoplete / code completion
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:deoplete#enable_at_startup = 1
" Options are 'complete', 'completefunc', and 'omnifunc'.
let g:deoplete#complete_method = 'complete'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Silver search (`ag`) + displaying results in cope.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" When you press gv you Ag after the selected text
vnoremap <silent> gv :call VisualSelection('gv', '')<CR>
" Open Ag and put the cursor in the right position
map <leader>ag :Ag
" When you press <leader>r you can search and replace the selected text
vnoremap <silent> <,r>r :call VisualSelection('replace', '')<CR>

" `cope` is a window usually used for displaying the current list of errors,
" but we can co-opt it to display search results from Ag with: <leader>cc
" To go to the next search result:       <leader>ne
" To go to the previous search result:   <leader>pe
map <leader>cc :botright cope<cr>
map <leader>co ggVGy:tabnew<cr>:set syntax=qf<cr>pgg
map <leader>ne :cn<cr>
map <leader>pe :cp<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Control-P
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set runtimepath^=~/.vim/bundle/ctrlp.vim

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeShowHidden=1
let NERDTreeIgnore=['.git$[[dir]]', 'node_modules$[[dir]]', '.DS_Store']


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


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GTM
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:gtm_plugin_status_enabled = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Dash
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <silent> <leader>ds <Plug>DashSearch

let g:tern#is_show_argument_hints_enabled = 1
let g:tern_show_argument_hints='on_hold'
let g:tern_map_keys=1
set conceallevel=2
au! BufRead,BufNewFile *.markdown set filetype=mkd
au! BufRead,BufNewFile *.md       set filetype=mkd

let g:FerretMap=0

" Default configuration for public GitHub
let g:github_dashboard = {
\ 'username': 'jessestuart'
\ }
let g:github_user = 'jessestuart'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colorizer
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:colorizer_auto_color = 1
