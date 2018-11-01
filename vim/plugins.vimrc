""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NerdTree
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" automatically open nerdtree on enter if no file was specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-n> :NERDTreeToggle<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-grepper
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nnoremap <leader>g :Grepper -tool git<cr>
" nnoremap <leader>g :Grepper -tool ag<cr>

nnoremap <leader>g :Grepper -tool ag -buffers -noswitch<cr>
nnoremap <leader>G :Grepper -tool ag -noswitch<cr>

" Optional. The default behaviour should work for most users.
" let g:grepper               = {}
" let g:grepper.tools         = ['ag']
" let g:grepper.jump          = 1
" let g:grepper.next_tool     = '<leader>g'
" let g:grepper.simple_prompt = 1
" let g:grepper.quickfix      = 0

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
 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" ALE
""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" IMPORTANT !!! 
" See also  ~/dotfiles/vim/ftplugin/ !!!!!!!!!!

" nnoremap ff <Plug>(ALEFix) # esto no va, no se pq
nnoremap ff :ALEFix<cr>

" Con esto no chequea hasta que se salva 
" Write this in your vimrc file
let g:ale_lint_on_text_changed = 'never'
" You can disable this option too
" if you don't want linters to run on opening a file
let g:ale_lint_on_enter = 0

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
let g:UltiSnipsExpandTrigger="<C-s>"
let g:UltiSnipsJumpForwardTrigger="<c-n>"
let g:UltiSnipsJumpBackwardTrigger="<c-p>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

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
" Tagbar
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nmap <F8> :TagbarToggle<CR>
nmap <C-p> :TagbarToggle<CR>

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
