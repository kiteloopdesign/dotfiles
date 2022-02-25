""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-commentary
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
setglobal commentstring=#\ %s
autocmd FileType verilog_systemverilog setlocal commentstring=//\ %s

autocmd FileType none setlocal commentstring=#\ %s
autocmd FileType unix setlocal commentstring=#\ %s

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"autocmd FileType verilog_systemverilog setlocal VerilogErrorFormat=NCVerilog\ 1
"autocmd FileType verilog_systemverilog set makeprg=xrun\ %

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" autocmd BufWrite *.py :call DeleteTrailingWS()
" autocmd BufWrite *.coffee :call DeleteTrailingWS()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" For Shift-K help 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" autocmd FileType php set keywordprg=~/.vim/php_doc
autocmd BufNewFile,BufRead *.py set keywordprg=pydoc
autocmd FileType vim setlocal keywordprg=:help


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Other
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType help noremap <buffer> q :q<cr>

" Automatically close preview window. this window is used for autcompletion (omnicompletion)
autocmd InsertLeave * if bufname('%') != '[Command Line]' | pclose | endif


" augroup numbertoggle
"   autocmd!
"   autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu | set relativenumber | endif
"   autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu | set norelativenumber | endif
" augroup END

" augroup python
"     autocmd!
"     " Add shiftwidth and/or softtabstop if you want to override those too.
"     autocmd FileType python setlocal noexpandtab tabstop=4
" augroup end


" Uncomment the following to have Vim jump to the last position when                                                       
" " reopening a file
 if has("autocmd")
   au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g`\"" | endif
endif
