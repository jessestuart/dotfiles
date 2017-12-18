" =============================================
" Asynchronous Lint Engine (ALE) configuration.
" =============================================
let g:ale_javascript_eslint_options = 'esversion: 6'
let g:ale_completion_enabled = 1
let g:ale_lint_on_save = 1

" Fix files automatically on save. (This is off by default)
let g:ale_fix_on_save = 1

let g:ale_sign_error = 'X'
let g:ale_sign_warning = '?'
let g:ale_statusline_format = ['X %d', '? %d', '']

" %linter% is the name of the linter that provided the message
" %s is the error or warning message
let g:ale_echo_msg_format = '%linter%: %s'

let g:ale_linters = {
      \  '*': ['remove_trailing_lines', 'trim_whitespace'],
      \  'Dockerfile': ['hadolint'],
      \  'javascript': ['prettier', 'flow', 'eslint'],
      \  'markdown': ['prettier'],
      \  'pandoc': ['prettier'],
      \  'python': ['isort', 'yapf'],
      \  'sh': ['shellcheck'],
      \  'vim': ['vint'],
      \  'yaml': ['yamllint', 'swaglint'],
      \  'zsh': ['shellcheck'],
      \  'css': ['prettier', 'stylelint'],
      \  'scss': ['prettier', 'stylelint']
      \}

" :ALEFix will attempt to fix your JS code using ESLint.
let g:ale_fixers = {
      \  'css': ['prettier', 'stylelint'],
      \  'javascript': ['eslint', 'prettier', 'prettier-eslint'],
      \  'markdown': ['prettier'],
      \  'pandoc': ['prettier'],
      \  'python': ['isort', 'yapf'],
      \  'scss': ['prettier', 'stylelint'],
      \  'sh': ['shfmt', 'remove_trailing_lines', 'trim_whitespace']
      \}

" Map keys to navigate between lines with errors and warnings.
nnoremap <leader>an :ALENextWrap<CR>
nnoremap <leader>ap :ALEPreviousWrap<CR>
nnoremap <leader>gaf :ALEFix<CR>
