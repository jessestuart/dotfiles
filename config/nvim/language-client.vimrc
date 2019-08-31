let g:LanguageClient_autoStart = 0

" \ 'javascript': ['flow-language-server', '--stdio'],
" \ 'javascript.jsx': ['flow', 'lsp'],
" \ 'javascript': ['javascript-typescript-stdio'],
" \ 'javascript.jsx': ['javascript-typescript-stdio'],
" \ 'typescript': ['typescript-language-server', '--stdio'],
" \ 'typescript.tsx': ['typescript-language-server', '--stdio'],
let g:LanguageClient_serverCommands = {
    \ 'sh': ['bash-language-server', 'start'],
    \ 'go': ['go-langserver'],
    \ 'javascript': ['javascript-typescript-stdio'],
    \ 'javascript.jsx': ['javascript-typescript-stdio'],
    \ 'typescript': ['tsserver'],
    \ 'typescript.tsx': ['tsserver'],
    \ 'markdown': ['markdown-language-server'],
    \ 'pandoc': ['markdown-language-server'],
    \ 'yaml': ['yaml-language-server', '--stdio'],
    \ }

" NOTE: disabled 20190718 to test out coc.nvim more.
nnoremap <F5> :call LanguageClient_contextMenu()<CR>
" nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
" nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

" set completefunc=LanguageClient#complete
" set omnifunc=LanguageClient#complete
" autocmd FileType javascript.jsx setlocal omnifunc=LanguageClient#complete
" autocmd FileType typescript setlocal omnifunc=LanguageClient#complete
" autocmd FileType typescript.tsx setlocal omnifunc=LanguageClient#complete

let g:LanguageClient_loggingLevel = 'INFO'
let g:LanguageClient_loggingFile = expand('~/.local/share/nvim/LanguageClient.log')
let g:LanguageClient_serverStderr = expand('~/.local/share/nvim/LanguageServer.log')
