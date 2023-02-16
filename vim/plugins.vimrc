""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ctrlp
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPBuffer'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Syntastic
""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Airline
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Automatically displays all buffers when there's only one tab open
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='base16'
" let g:airline_theme='solarized'
" let g:airline_solarized_bg='dark'
let g:airline_powerline_fonts = 1
" let g:airline_section_c = %F
" Show path
let g:airline#extensions#tabline#formatter = 'default'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NerdTree
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" automatically open nerdtree on enter if no file was specified
" autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" map <C-n> :NERDTreeToggle<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-grepper
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nnoremap <leader>g :Grepper -tool git<cr>
" nnoremap <leader>g :Grepper -tool ag<cr>

nmap gs <plug>(GrepperOperator)
xmap gs <plug>(GrepperOperator)

nnoremap <leader>g :Grepper -tool grep -buffers -noswitch<cr>
nnoremap <leader>G :Grepper -tool grep -noswitch<cr>

" Optional. The default behaviour should work for most users.
let g:grepper               = {}
let g:grepper.tools         = ['grep','git']
let g:grepper.jump          = 1
let g:grepper.next_tool     = '<leader>g'
let g:grepper.simple_prompt = 1
let g:grepper.quickfix      = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ack
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" cnoreabbrev Ack Ack!
" nnoremap <Leader>a :Ack!<Space>
" TODO : no puedo hacer funcionar bien este tio ... NO me busca en los buferes,
" incluso aunque no esten hidden
" nnoremap <Leader>a :AckWindow!<Space>

" TODO : se le puede decir a ack de usar ag pero aun se ralla mas ...
" let g:ackprg = 'ag --nogroup --nocolor --column'

" Otra forma mas de usar ag 
" if executable('ag')
"   let g:ackprg = 'ag --vimgrep'
" endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FZF
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ag on (I believe) current path
map <leader>a :Ag 
" Open file
nnoremap <leader>e :Files<cr>
" Open Buffer
nnoremap <leader>b :Buffers<cr>
" nnoremap , :Buffers<cr>
nnoremap <leader>t :Tags<cr>

" open most used files list
nnoremap <silent> <leader>m :History<CR>

" fzf is installed via git clone, then vim plugin is not needed, just this
set runtimepath+=~/.fzf


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Put here all the things related to prose plugins (eg pencil plugin)
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" lexical
" These are the defaults.
let g:lexical#thesaurus = ['~/.vim/thesaurus/mthesaur.txt',]
let g:lexical#dictionary = ['/usr/share/dict/words',]
let g:lexical#spellfile = ['~/.vim/spell/en.utf-8.add',]

" for using features in normal mode. in insert they use 
" let g:lexical#dictionary_key = '<leader>k'
" let g:lexical#thesaurus_key = '<leader>t'
" let g:lexical#spell_key = '<leader>s'

" Not really a plugin thing, but sugggested in vim-litecorrect plugin, so adding it here 
" Correct better autocorrect option in the first misspelled word before the cursor
nnoremap <C-s> [s1z=<c-o>
inoremap <C-s> <c-g>u<Esc>[s1z=`]A<c-g>u
" TODO : add a map for "add to spell dict"

" TODO: el statusline no la tengo controlada ... no veo nada distinto
" Taken form vim-pencil github. Shows whether there is rad/sofr line break
" set statusline=%<%f\ %h%m%r%w\ \ %{PencilMode()}\ %=\ col\ %c%V\ \ line\ %l\,%L\ %P
" set rulerformat=%-12.(%l,%c%V%)%{PencilMode()}\ %P

" default is 74, looks too short to me ...
let g:pencil#textwidth = 90

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" ALE
"""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" IMPORTANT !!! 
"" See also  ~/dotfiles/vim/ftplugin/ !!!!!!!!!!
"" nnoremap ff <Plug>(ALEFix) # esto no va, no se pq
"nnoremap ff :ALEFix<cr>
"" Con esto no chequea hasta que se salva 
"" Write this in your vimrc file
"let g:ale_lint_on_text_changed = 'never'
"" You can disable this option too
"" if you don't want linters to run on opening a file
"let g:ale_lint_on_enter = 0


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" coc
"""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"" To make <cr> select the first completion item and confirm the completion when no item has been selected:
"inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"

""to make coc.nvim format your code on <cr>:
"inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"


"" TODO: parece que esto lo hace by default
"" " Use <Tab> and <S-Tab> to navigate the completion list:
"" inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
"" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

"" use <c-space> for trigger completion
"inoremap <silent><expr> <c-@> coc#refresh()

"" Make <CR> auto-select the first completion item and notify coc.nvim to
"" format on enter, <cr> could be remapped by other vim plugin
"inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
"                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

"" Use `[g` and `]g` to navigate diagnostics
"" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
"nmap <silent> [g <Plug>(coc-diagnostic-prev)
"nmap <silent> ]g <Plug>(coc-diagnostic-next)

"" GoTo code navigation.
"nmap <silent> gd <Plug>(coc-definition)
"nmap <silent> gy <Plug>(coc-type-definition)
"nmap <silent> gi <Plug>(coc-implementation)
"nmap <silent> gr <Plug>(coc-references)

"" Use K to show documentation in preview window.
"nnoremap <silent> K :call <SID>show_documentation()<CR>

"function! s:show_documentation()
"  if (index(['vim','help'], &filetype) >= 0)
"    execute 'h '.expand('<cword>')
"  elseif (coc#rpc#ready())
"    call CocActionAsync('doHover')
"  else
"    execute '!' . &keywordprg . " " . expand('<cword>')
"  endif
"endfunction

"" Highlight the symbol and its references when holding the cursor.
"autocmd CursorHold * silent call CocActionAsync('highlight')

"" Symbol renaming.
"nmap <leader>rn <Plug>(coc-rename)

"" Formatting selected code.
"xmap <leader>f  <Plug>(coc-format-selected)
"nmap <leader>f  <Plug>(coc-format-selected)

"" I dont know what this is for
"" augroup mygroup
""   autocmd!
""   " Setup formatexpr specified filetype(s).
""   autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
""   " Update signature help on jump placeholder.
""   autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
"" augroup end

"" Applying codeAction to the selected region.
"" Example: `<leader>aap` for current paragraph
"xmap <leader>a  <Plug>(coc-codeaction-selected)
"nmap <leader>a  <Plug>(coc-codeaction-selected)

"" Remap keys for applying codeAction to the current buffer.
"nmap <leader>ac  <Plug>(coc-codeaction)
"" Apply AutoFix to problem on the current line.
"" nmap <leader>qf  <Plug>(coc-fix-current)
"nmap <leader>cf  <Plug>(coc-fix-current)

"" Run the Code Lens action on the current line.
"nmap <leader>cl  <Plug>(coc-codelens-action)

""
"" ... There's more crap here that I dont know what it is for ...
""

"" Add (Neo)Vim's native statusline support.
"" NOTE: Please see `:h coc-status` for integrations with external plugins that
"" provide custom statusline: lightline.vim, vim-airline.
"set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

""
"" ... There's more crap here that I dont know what it is for ...
""


"" " TODO: el chino pilla rollo con este issue, que es tonto pero no parece que
"" " haya una solucion facil. solo quiero enablear esta mierda para algunos files
"" function! s:disable_coc_for_type()
""         let l:filesuffix_blacklist = ['c', 'cpp', 'h', 'asm', 'hpp', 'vim', 'sh', 'py']
"" 	if index(l:filesuffix_blacklist, expand('%:e')) != -1
"" 		let b:coc_enabled = 0
"" 	endif
"" endfunction
"" autocmd BufRead,BufNewFile * call s:disable_coc_for_type()
"function! s:enable_coc_for_type()
"        let l:filesuffix_whitelist = ['c', 'cpp', 'h']
"        " let l:filesuffix_whitelist = ['c', 'cpp', 'h', 'asm', 'hpp', 'vim', 'sh', 'py']
"	if index(l:filesuffix_whitelist, expand('%:e')) == -1
"		let b:coc_enabled = 0
"	endif
"endfunction
"autocmd BufRead,BufNewFile * call s:enable_coc_for_type()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" vim-verilog-instance
""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" gbi(
" Start VerilogInstance command (gb) for inner (parenthesis
" vjjgb
" visual-select j down twice
let g:verilog_instance_skip_last_coma = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Syntastic
""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Easy Align
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Snippets
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
" let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsExpandTrigger="<leader>s"
" let g:UltiSnipsExpandTrigger="<C-s>"
" let g:UltiSnipsJumpForwardTrigger="<c-n>"
" let g:UltiSnipsJumpBackwardTrigger="<c-p>"

" If you want :UltiSnipsEdit to split your window.
" let g:UltiSnipsEditSplit="vertical"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" hl_matchit : underlines matches of '%-able' words. e.g. begin-end
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" If this variable is set, augroup is defined, and start highlighting.
let g:hl_matchit_enable_on_vim_startup = 1

" you can specify highlight group. see :highlight
" Default is let g:hl_matchit_hl_groupname = 'cursorline'
" more visible
let g:hl_matchit_hl_groupname = 'VisualNOS'

" I recomend  g:hl_matchit_speed_level = 1 because highlight is
" just an addition.  If 1 is set, sometimes do not highlight.
" let g:hl_matchit_speed_level = 1 " or 2

" you can specify use hl_matchit filetype.let g:hl_matchit_allow_ft = 'html,vim,sh' 
" only enabled for verilog so far ...
let g:hl_matchit_allow_ft = 'verilog_systemverilog'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" neomake
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" When writing a buffer (no delay).
" call neomake#configure#automake('w')

" " When writing a buffer (no delay), and on normal mode changes (after 750ms).
" call neomake#configure#automake('nw', 750)
" " When reading a buffer (after 1s), and when writing (no delay).
" call neomake#configure#automake('rw', 1000)
" " Full config: when writing or reading a buffer, and on changes in insert and
" " normal mode (after 500ms; no delay when writing).
" call neomake#configure#automake('nrwi', 500)

" let g:neomake_open_list = 2

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vmath
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vmap <expr>  ++  VMATH_YankAndAnalyse()
nmap         ++  vip++

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tagbar
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <F8> :TagbarToggle<CR>
" nmap <C-p> :TagbarToggle<CR>

" see https://github.com/majutsushi/tagbar/wiki#systemverilog
let g:tagbar_type_systemverilog = {
    \ 'ctagstype': 'systemverilog',
    \ 'kinds' : [
         \'A:assertions',
         \'C:classes',
         \'E:enumerators',
         \'I:interfaces',
         \'K:packages',
         \'M:modports',
         \'P:programs',
         \'Q:prototypes',
         \'R:properties',
         \'S:structs and unions',
         \'T:type declarations',
         \'V:covergroups',
         \'b:blocks',
         \'c:constants',
         \'e:events',
         \'f:functions',
         \'m:modules',
         \'n:net data types',
         \'p:ports',
         \'r:register data types',
         \'t:tasks',
     \],
     \ 'sro': '.',
     \ 'kind2scope' : {
        \ 'K' : 'package',
        \ 'C' : 'class',
        \ 'm' : 'module',
        \ 'P' : 'program',
        \ 'I' : 'interface',
        \ 'M' : 'modport',
        \ 'f' : 'function',
        \ 't' : 'task',
     \},
     \ 'scope2kind' : {
        \ 'package'   : 'K',
        \ 'class'     : 'C',
        \ 'module'    : 'm',
        \ 'program'   : 'P',
        \ 'interface' : 'I',
        \ 'modport'   : 'M',
        \ 'function'  : 'f',
        \ 'task'      : 't',
     \ },
     \}
