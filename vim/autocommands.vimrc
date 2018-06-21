""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()

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

" " Do not use relative line numbers when in insert mode or not in focus
" augroup numbertoggle
"   autocmd!
"   autocmd BufEnter,FocusGained,InsertLeave * set number relativenumber
"   autocmd BufLeave,FocusLost,InsertEnter   * set number norelativenumber
" augroup END


augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu | set rnu   | endif
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu | set nornu | endif
augroup END
