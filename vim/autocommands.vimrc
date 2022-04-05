""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-commentary
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
setglobal commentstring=#\ %s
autocmd FileType verilog_systemverilog setlocal commentstring=//\ %s

autocmd FileType none setlocal commentstring=#\ %s
autocmd FileType unix setlocal commentstring=#\ %s

" 1st remove all comments, then add comments only on first line "f:"
" TODO: not working ... gcc inserts /* ... */
autocmd FileType c,cpp setlocal comments-=:// comments+=f://

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" initializes together several prose plugins : 
" pencil (muchas cosas)
" lexical : lenguage correction, sinonimos!
" litecorrect (autocorrects text)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" augroup litecorrect
"   autocmd!
"   autocmd FileType markdown,mkd call litecorrect#init()
"   autocmd FileType rst call litecorrect#init()
" augroup END

augroup pencil
  autocmd!

  autocmd FileType rst,markdown,mkd call pencil#init()
                                \ | call litecorrect#init()
                                \ | call lexical#init()

  autocmd FileType text call lexical#init({ 'spell': 0 })

  " autocmd FileType markdown,mkd call pencil#init()
  "                           \ | call litecorrect#init()

                            " \ | call textobj#quote#init()
                            " \ | call textobj#sentence#init()
augroup END


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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
