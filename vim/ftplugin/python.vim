"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ALE PLUGIN 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Check Python files with flake8 and pylint.
let b:ale_linters = ['flake8', 'pylint']
" Fix Python files with autopep8 and yapf.
let b:ale_fixers = ['autopep8', 'yapf', 'remove_trailing_lines', 'trim_whitespace']
" Disable warnings about trailing whitespace for Python files.
let b:ale_warn_about_trailing_whitespace = 0
" Enable completion where available.
let g:ale_completion_enabled = 1


" let g:ale_python_flake8_args = '--ignore=E,W,F403,F405 --select=F,C'
" let g:ale_python_flake8_args = '--ignore=E501'

" Navigate b/w errors quickly
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
