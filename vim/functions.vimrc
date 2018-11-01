" edit vimrc from vim
" func! Ev()
"   :e $MYVIMRC
" endfunc

" Edit vimrc file
command! Ev :e $MYVIMRC
" source vimrc file
command! Sv :source $MYVIMRC

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc

" Dumps mappings to debug them
function! DumpMappings()
  :redir >> mappings
  :map
  :redir END
endfunction

function! QuickfixToggle() "{{{

    let nr = winnr("$")
    cwindow
    let nr2 = winnr("$")
    if nr == nr2
        cclose
    endif

endfunction "}}}

nnoremap <leader>Q :call QuickfixToggle()<CR>

