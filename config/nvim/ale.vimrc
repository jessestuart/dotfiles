" =============================================
" Asynchronous Lint Engine (ALE) configuration.
" =============================================
let g:ale_javascript_eslint_options = 'esversion: 9'
let g:ale_completion_enabled = 1
let g:ale_lint_on_save = 1
let g:ale_javascript_prettier_use_local_config = 1

" Fix files automatically on save. (This is off by default)
let g:ale_fix_on_save = 1

let g:ale_sign_error = '●'
let g:ale_sign_warning = '.'
let g:ale_lint_on_enter = 1

let g:ale_statusline_format = ['X %d', '? %d', '']

" %linter% is the name of the linter that provided the message
" %s is the error or warning message
" let g:ale_echo_msg_format = '%linter%: %s'

let g:ale_echo_msg_format = '%linter%: %s [%code%]'

" \  'javascript': ['flow', 'eslint', 'prettier', 'prettier-eslint'],
" , 'prettier-eslint', 'flow', 'eslint'],
let g:ale_linters = {
      \  '*': ['remove_trailing_lines', 'trim_whitespace'],
      \  'ansible': ['ansible-lint'],
      \  'css': ['prettier', 'prettier-eslint', 'stylelint'],
      \  'Dockerfile': ['hadolint'],
      \  'javascript': ['prettier', 'flow', 'eslint'],
      \  'javascript.jsx': ['prettier', 'flow', 'eslint'],
      \  'json': ['prettier'],
      \  'markdown': ['prettier'],
      \  'pandoc': ['prettier'],
      \  'python': ['isort', 'yapf'],
      \  'ruby': ['rubocop'],
      \  'scss': ['prettier', 'prettier-eslint', 'stylelint'],
      \  'sh': ['shfmt', 'shellcheck'],
      \  'typescript': ['prettier', 'tsc', 'tslint'],
      \  'typescript.tsx': ['prettier', 'tsc', 'tslint'],
      \  'vim': ['vint'],
      \  'yaml': ['yamllint', 'swaglint', 'prettier'],
      \  'zsh': ['shellcheck'],
      \}

      " \  'javascript.jsx': ['importjs', 'standard', 'prettier-eslint', 'eslint'],
let g:ale_fixers = {
      \  '*': ['remove_trailing_lines', 'trim_whitespace'],
      \  'bash': ['shfmt'],
      \  'css': ['prettier', 'stylelint'],
      \  'go': ['gofmt', 'goimports'],
      \  'javascript': ['importjs', 'prettier-eslint', 'eslint'],
      \  'javascript.jsx': ['importjs', 'prettier-eslint', 'eslint'],
      \  'json': ['prettier'],
      \  'markdown': ['prettier'],
      \  'pandoc': ['prettier'],
      \  'python': ['isort', 'yapf'],
      \  'ruby': ['rubocop'],
      \  'scss': ['prettier', 'stylelint'],
      \  'sh': ['shfmt'],
      \  'typescript': ['prettier', 'tslint'],
      \  'typescript.tsx': ['prettier', 'tslint'],
      \  'yaml': ['prettier'],
      \  'zsh': ['shfmt'],
      \}

" Map keys to navigate between lines with errors and warnings.
nnoremap <leader>an :ALENextWrap<CR>
nnoremap <leader>ap :ALEPreviousWrap<CR>
nnoremap <leader>af :ALEFix<CR>
