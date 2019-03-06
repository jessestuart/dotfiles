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

let g:ale_statusline_format = ['X %d', '? %d', '']

" %linter% is the name of the linter that provided the message
" %s is the error or warning message
" let g:ale_echo_msg_format = '%linter%: %s'

let g:ale_echo_msg_format = '%linter%: %s [%code%]'

" \  'javascript': ['flow', 'eslint', 'prettier', 'prettier-eslint'],
" , 'prettier-eslint', 'flow', 'eslint'],
"
      " \  'typescript': ['prettier', 'tsc', 'tslint', 'eslint'],
      " \  'typescript.tsx': ['prettier', 'tsc', 'tslint', 'eslint'],
let g:ale_linters = {
      \  '*': ['remove_trailing_lines', 'trim_whitespace'],
      \  'ansible': ['ansible-lint'],
      \  'bash': ['shfmt'],
      \  'Dockerfile': ['hadolint'],
      \  'javascript': ['prettier', 'standard', 'flow', 'eslint'],
      \  'javascript.jsx': ['importjs', 'prettier-eslint', 'flow', 'eslint'],
      \  'json': ['prettier'],
      \  'typescript': ['eslint', 'tslint'],
      \  'typescript.tsx': ['eslint', 'tslint'],
      \  'markdown': ['prettier'],
      \  'pandoc': ['prettier'],
      \  'python': ['isort', 'yapf'],
      \  'sh': ['shfmt', 'shellcheck'],
      \  'vim': ['vint'],
      \  'yaml': ['yamllint', 'swaglint', 'prettier'],
      \  'zsh': ['shellcheck'],
      \  'css': ['prettier', 'prettier-eslint', 'stylelint'],
      \  'scss': ['prettier', 'prettier-eslint', 'stylelint'],
      \  'ruby': ['rubocop'],
      \}

      " \  'javascript.jsx': ['importjs', 'standard'],
      " \  'javascript': ['importjs', 'standard', 'prettier-eslint', 'eslint'],
      " \  'typescript': ['importjs', 'prettier', 'tslint', 'eslint'],
      " \  'typescript.tsx': ['importjs', 'prettier', 'tslint', 'eslint'],
let g:ale_fixers = {
      \  '*': ['remove_trailing_lines', 'trim_whitespace'],
      \  'bash': ['shfmt'],
      \  'css': ['prettier', 'stylelint'],
      \  'go': ['gofmt', 'goimports'],
      \  'javascript': ['importjs', 'standard', 'prettier-eslint', 'eslint'],
      \  'javascript.jsx': ['prettier-eslint', 'eslint', 'flow'],
      \  'json': ['prettier'],
      \  'markdown': ['prettier'],
      \  'pandoc': ['prettier'],
      \  'python': ['isort', 'yapf'],
      \  'ruby': ['rubocop'],
      \  'scss': ['prettier', 'stylelint'],
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

call airline#parts#define_function('ALE', 'ALEGetStatusLine')
call airline#parts#define_condition('ALE', 'exists("*ALEGetStatusLine")')
let g:airline_section_error = airline#section#create_right(['ALE'])
let g:ale_sign_column_always = 1
