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
      \  'Dockerfile': ['hadolint'],
      \  'javascript': ['prettier', 'standard', 'flow'],
      \  'json': ['prettier'],
      \  'typescript': ['prettier', 'tsc', 'tslint'],
      \  'typescript.tsx': ['prettier', 'tsc', 'tslint'],
      \  'markdown': ['prettier'],
      \  'pandoc': ['prettier'],
      \  'python': ['isort', 'yapf'],
      \  'sh': ['shfmt', 'shellcheck'],
      \  'vim': ['vint'],
      \  'yaml': ['yamllint', 'swaglint', 'prettier'],
      \  'zsh': ['shellcheck'],
      \  'css': ['prettier', 'prettier-eslint', 'stylelint'],
      \  'scss': ['prettier', 'prettier-eslint', 'stylelint'],
      \  'ruby': ['rubocop']
      \}

      " \  'javascript.jsx': ['importjs', 'standard', 'prettier-eslint', 'eslint'],
      " \  'pandoc': ['prettier'],
let g:ale_fixers = {
      \  '*': ['remove_trailing_lines', 'trim_whitespace'],
      \  'css': ['prettier', 'stylelint'],
      \  'go': ['gofmt', 'goimports'],
      \  'javascript': ['importjs', 'eslint'],
      \  'javascript.jsx': ['importjs', 'standard'],
      \  'typescript': ['prettier', 'tslint'],
      \  'typescript.tsx': ['prettier', 'tslint'],
      \  'json': ['prettier'],
      \  'markdown': ['prettier'],
      \  'python': ['isort', 'yapf'],
      \  'scss': ['prettier', 'stylelint'],
      \  'sh': ['shfmt'],
      \  'bash': ['shfmt'],
      \  'zsh': ['shfmt'],
      \  'ruby': ['rubocop'],
      \  'yaml': ['prettier']
      \}

" Map keys to navigate between lines with errors and warnings.
nnoremap <leader>an :ALENextWrap<CR>
nnoremap <leader>ap :ALEPreviousWrap<CR>
nnoremap <leader>af :ALEFix<CR>
