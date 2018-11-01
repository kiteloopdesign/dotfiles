"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Verilog-system verilog 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VerilogErrorFormat iverilog
" set makeprg=/usr/local/bin/iverilog\ %

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ALE PLUGIN 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ale_linter_aliases = {'verilog_systemverilog': 'verilog'}

" let g:ale_linters  = {'verilog_systemverilog': ['verilator']}
" let g:ale_verilog_verilator_options  = '-sv --default-language "1800-2012"'

let g:ale_linters  = {'verilog_systemverilog': ['iverilog']}


" Fix Python files with autopep8 and yapf.
" let b:ale_fixers = ['iverilog']
" Disable warnings about trailing whitespace for Python files.
let b:ale_warn_about_trailing_whitespace = 1
" Enable completion where available.
let g:ale_completion_enabled = 1

" Navigate b/w errors quickly
" nmap <silent> <C-k> <Plug>(ale_previous_wrap)
" nmap <silent> <C-j> <Plug>(ale_next_wrap)
