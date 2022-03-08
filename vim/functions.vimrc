" edit vimrc from vim
" func! Ev()
"   :e $MYVIMRC
" endfunc

" Edit vimrc file
command! Ev :e $MYVIMRC
" source vimrc file
command! Sv :source $MYVIMRC

" command! Es :e /home/pablo.mora/projects/mp2784/vim.source
command! Es :e $HOME/projects/mp2784/digital/users/pablo.mora/vim.source
command! Ss :source /home/pablo.mora/projects/mp2784/digital/users/pablo.mora/vim.source

" TODO
" Find work and cd into it
" command! Gw :source $MYVIMRC

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc

" Delete ^M from DOS
func! DeleteCarriageRerturn()
  exe "normal mz"
  %s///g
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

" Taken from vim-lexical github site
function! SpellCheckerMyHelp()
  let text=<< trim END
      "
      "
      " ]s	- Move to next misspelled word after the cursor.
      " [s	- Like ]s but search backwards
      " ]S	- Like ]s but only stop at bad words, not at rare words or words for another region.
      " [S	- Like ]S but search backwards.

  " With the following key mappings you can use Visual mode selection to select the characters (including whitespace). Otherwise the word under the cursor is used.

      " zg	- Mark as a good word
      " zw	- Like zg but mark the word as a wrong (bad) word.
      " zug - Unmark as good word
      " zuw - Unmark as wrong (bad) word
      " z=	- For the word under/after the cursor suggest correctly spelled words
      " 1z=	- Use the first suggestion, without prompting
      " . - Redo - repeat last word replacement
      " :spellr - Repeat the replacement done by z= for all matches with the replaced word in the current window
      
      " MAYBE THESE WORK WITH TAB COMPLETION. OTHERWISE YOU MIGHT WANT TO USE
      " THE RECOMMENDED PLUGIN
      "
      " Spelling sugestions
      " For spelling suggestions while in Insert mode:
      "     «CTRL-X» «CTRL-S» (or «CTRL-X» «s» for terminal users) - suggest spelling, using «CTRL-P» and «CTRL-N» to navigate.

      " Thesaurus lookup
      " For thesaurus lookup while in Insert mode:
      "     «CTRL-X» «CTRL-T» - thesaurus lookup, using «CTRL-P» and «CTRL-N» to navigate.

      " Dictionary completion
      " For dictionary completion while in Insert mode:
      "     «CTRL-X» «CTRL-K» - dictionary completion, using «CTRL-P» and «CTRL-N» to navigate.
      "
      "
  END
  echo text

endfunction


function! PrintSyntaxSettings()
    " echo 'expandtab'   &expandtab
    " echo 'tabstop'     &tabstop
    " echo 'autoindent'  &autoindent
    " echo 'softtabstop' &softtabstop
    " echo 'shiftwidth'  &shiftwidth
	
    verbose set autoindent?  
    verbose set cindent?  
    verbose set smartindent?  
    verbose set indentexpr?  
    verbose set indentexpr?  
    
    verbose set ai? cin? cink? cino? si? inde? indk?

    verbose set expandtab?   
    verbose set tabstop?     
    verbose set softtabstop? 
    verbose set shiftwidth?  

endfunction


function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction

function! s:ShowMaps()
  let old_reg = getreg("a")          " save the current content of register a
  let old_reg_type = getregtype("a") " save the type of the register as well
try
  redir @a                           " redirect output to register a
  " Get the list of all key mappings silently, satisfy "Press ENTER to continue"
  silent map | call feedkeys("\<CR>")
  redir END                          " end output redirection
  vnew                               " new buffer in vertical window
  put a                              " put content of register
  " Sort on 4th character column which is the key(s)
  %!sort -k1.4,1.4
finally                              " Execute even if exception is raised
  call setreg("a", old_reg, old_reg_type) " restore register a
endtry
endfunction
com! ShowMaps call s:ShowMaps()      " Enable :ShowMaps to call the function

nnoremap \m :ShowMaps<CR>            " Map keys to call the function
