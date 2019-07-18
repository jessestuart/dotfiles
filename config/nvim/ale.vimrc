scriptencoding utf-8

" =============================================
" Asynchronous Lint Engine (ALE) configuration.
" =============================================
" let g:ale_javascript_eslint_options = 'esversion: 9'
let g:ale_completion_enabled = 1
let g:ale_lint_on_save = 1
let g:ale_javascript_prettier_use_local_config = 1

" Fix files automatically on save. (This is off by default)
let g:ale_fix_on_save = 1

let g:ale_sign_error = '●'
let g:ale_sign_warning = '.'
let g:ale_lint_on_enter = 1

" let g:ale_statusline_format = ['X %d', '? %d', '']
" function! LinterStatus() abort
"     let l:counts = ale#statusline#Count(bufnr(''))
"     let l:all_errors = l:counts.error + l:counts.style_error
"     let l:all_non_errors = l:counts.total - l:all_errors
"     return l:counts.total == 0 ? 'OK' : printf(
"     \   '%dW %dE',
"     \   all_non_errors,
"     \   all_errors
"     \)
" endfunction

" %linter% is the name of the linter that provided the message
" %s is the error or warning message
" let g:ale_echo_msg_format = '%linter%: %s'
let g:ale_echo_msg_format = '%linter%: %s [%code%]'

" let g:ale_linters = {
"       \  '*': ['remove_trailing_lines', 'trim_whitespace'],
"       \  'ansible': ['ansible-lint'],
"       \  'bash': ['shfmt'],
"       \  'Dockerfile': ['hadolint'],
"       \  'javascript': ['prettier', 'standard', 'flow', 'eslint'],
"       \  'javascript.jsx': ['importjs', 'prettier-eslint', 'flow', 'eslint'],
"       \  'json': ['prettier'],
"       \  'typescript': ['eslint', 'tslint'],
"       \  'typescript.tsx': ['eslint', 'tslint'],
"       \  'markdown': ['prettier', 'vale'],
"       \  'pandoc': ['prettier', 'vale'],
"       \  'python': ['isort', 'yapf'],
"       \  'sh': ['shfmt', 'shellcheck', 'language_server'],
"       \  'vim': ['vint'],
"       \  'yaml': ['yamllint', 'swaglint', 'prettier'],
"       \  'zsh': ['shellcheck'],
"       \  'css': ['prettier', 'prettier-eslint', 'stylelint'],
"       \  'scss': ['prettier', 'prettier-eslint', 'stylelint'],
"       \  'ruby': ['rubocop'],
"       \}

let g:ale_linters = {
  \ 'typescript': ['eslint', 'tslint'],
  \ 'typescript.tsx': ['eslint', 'tslint'],
  \}

let g:ale_fixers = {
      \  '*': ['remove_trailing_lines', 'trim_whitespace'],
      \  'bash': ['shfmt'],
      \  'css': ['prettier', 'stylelint'],
      \  'go': ['gofmt', 'goimports'],
      \  'javascript': ['importjs', 'standard', 'prettier-eslint', 'eslint'],
      \  'javascript.jsx': [ 'importjs', 'standard', 'prettier-eslint', 'eslint'],
      \  'json': ['fixjson', 'prettier'],
      \  'markdown': ['prettier', 'textlint'],
      \  'pandoc': ['prettier', 'textlint'],
      \  'python': ['isort', 'black'],
      \  'ruby': ['rubocop'],
      \  'sh': ['shfmt'],
      \  'typescript': ['importjs', 'prettier', 'eslint', 'tslint'],
      \  'typescript.tsx': ['importjs', 'prettier', 'eslint', 'tslint'],
      \  'yaml': ['prettier'],
      \  'zsh': ['shfmt'],
      \}

" Map keys to navigate between lines with errors and warnings.
nnoremap <leader>an :ALENextWrap<CR>
nnoremap <leader>ap :ALEPreviousWrap<CR>
nnoremap <leader>af :ALEFix<CR>

let g:ale_sign_column_always = 1
let g:ale_virtualtext_cursor = 1

" let g:ale_pattern_options = {
" \   '.*\.tsx?$': {'ale_enabled': 0},
" \}
