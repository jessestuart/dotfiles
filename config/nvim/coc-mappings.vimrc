" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

nnoremap <silent> <leader>co  :<C-u>CocList outline<cr>
nnoremap <silent> <leader>cs  :<C-u>CocList -I symbols<cr>

" ======================
" Adapted largely from:
" https://github.com/rstacruz/vim-coc-settings/blob/master/after/plugin/coc.vim
" ======================

" List errors
" nnoremap <silent> <leader>cl  :<C-u>CocList locationlist<cr>
nnoremap ma ma

" restart when tsserver gets wonky
nnoremap <silent> <leader>cR  :<C-u>CocRestart<CR>

" manage extensions
nnoremap <silent> <leader>cx  :<C-u>CocList extensions<cr>

" rename the current word in the cursor
nmap <leader>cr  <Plug>(coc-rename)
nmap <leader>cf  <Plug>(coc-format-selected)
vmap <leader>cf  <Plug>(coc-format-selected)

" run code actions
vmap <leader>ca  <Plug>(coc-codeaction-selected)
nmap <leader>ca  <Plug>(coc-codeaction-selected)

nnoremap <M-d>  :<C-u>CocList diagnostics<cr>
" nnoremap <silent> <M-d>  :<C-u>CocList diagnostics<cr>
