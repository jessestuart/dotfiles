"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FZF
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" --column: Show column number
" --line-number: Show line number
" --no-heading: Do not show file headings in results
" --fixed-strings: Search term as a literal string
" --ignore-case: Case insensitive search
" --no-ignore: Do not respect .gitignore, etc...
" --hidden: Search hidden files and folders
" --follow: Follow symlinks
" --glob: Additional conditions for search (in this case ignore everything in
"         the .git/ folder)
" --color: Search color options
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always"'.shellescape(<q-args>), 1, <bang>0)

nnoremap <Leader>F :GFiles<CR>
nnoremap <Leader>R :Tags<CR>

nnoremap <C-f> :GFiles<CR>

set runtimepath+='~/.fzf'

" let g:fzf_layout = { 'window': 'enew' }

let g:fzf_history_dir = '~/.local/share/fzf-history'
