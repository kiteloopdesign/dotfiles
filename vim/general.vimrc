"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Disable freaking Ex mode
map Q <Nop>

" Quit all buffers when using ZQ
noremap ZQ :qa!<cr>

" enable mouse, so we can click b/w splits for example
" Using this kills the middle-mouse copy-paste
" set mouse=a

" Sets how many lines of history VIM has to remember
set history=500


" Enable filetype plugins
filetype plugin indent on
" equivalent to these three:
" filetype on
" filetype plugin on
" filetype indent on


" Allows to use '%' to jump between pairs of words, e.g. begin-end
runtime macros/matchit.vim

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = "\<Space>"

" Fast saving
nmap <leader>w :w!<cr>

" :W sudo saves the file 
" (useful for handling the permission-denied error)
" command W w !sudo tee % > /dev/null

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" IMPORTANT! Check plugins.vimrc for other mappings!
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Allows to copy b/w vim and X
" set clipboard=unnamedplus
" set clipboard=unnamed
set clipboard+=unnamedplus
set paste               " Paste from a windows or from vim
set go+=a               " Visual selection automatically copied to the clipboard

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Fucking wayland mapping
" TODO: Can't copy FROM vim INTO other window
" TODO: Only work when visual selecting line. 'yy' as before
" doesnt work anymore
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nnoremap <C-@> :call system("wl-copy", @")<CR>
vmap <silent> y y:call system("wl-copy", @@)<CR>
" nmap <silent> y y:call system("wl-copy", @@)<CR>
" xnoremap <silent> <C-@> :w !wl-copy<CR><CR>

" xnoremap "+y y:call system("wl-copy", @")<cr>
" nnoremap "+p :let @"=substitute(system("wl-paste --no-newline"), '<C-v><C-m>', '', 'g')<cr>p
" nnoremap "*p :let @"=substitute(system("wl-paste --no-newline --primary"), '<C-v><C-m>', '', 'g')<cr>p

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set shell title depending on vim file
set title
" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Turn on the WiLd menu
set wildmenu
" Pretty much like bash
set wildmode=list:longest

" Set relative line numbers
set relativenumber

" Easier to get in command mode
" Removed as it messes with repeat last search
" nnoremap ; :
" vnoremap ; :


" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

"Always show current position
set ruler

" Line numbering
set number

" Height of the command bar
set cmdheight=1

" A buffer becomes hidden when it is abandoned
set hidden

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

"Invert search direction adn do not jump when searching
" nnoremap £ £``
nnoremap £ *``
nnoremap * £``

"do not wrap at the end of file
set nowrapscan
set nowrap

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch 

" Don't redraw while executing macros (good performance config)
set lazyredraw 

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch 
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set visualbell  " remove sound, use flash instead
set t_vb=       " flash set to infinity so no flash
set tm=500

" Add a bit extra margin to the left
set foldcolumn=0

" Set column width max
" set colorcolumn=80
" highlight ColorColumn ctermbg=gray guibg=lightgrey


" eol - Character to show at the end of each line.
" tab - Two characters to be used to show a tab.
" trail - Character to show for trailing spaces.
" extends - Character to show in the last column when the line continues beyond the right of the screen.
" precedes - Character to show in the first column when the line continues beyond the left of the screen.
" conceal - Character to show in place of concealed text, when conceallevel is set to 1.
" nbsp - Character to show for a space.
" Here is how I??ve set listchars in my configuration:
" set listchars=eol:$,nbsp:_,tab:>-,trail:~,extends:>,precedes:<
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:·
noremap <F5> :set list!<CR>
inoremap <F5> <C-o>:set list!<CR>
cnoremap <F5> <C-c>:set list!<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable 

" Enable 256 colors palette in Gnome Terminal
if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif

" try
"     colorscheme desert
" catch
" endtry

" Solarized
let g:solarized_termcolors=256
set background=dark
colorscheme solarized

" nmap <leader>bg :set background=light<cr>
map <Leader>bg :let &background = ( &background == "dark"? "light" : "dark" )<CR>

" set guifont=Inconsolata\ for\ Powerline:h15
" let g:Powerline_symbols = 'fancy'
" set encoding=utf-8
" set t_Co=256
" set fillchars+=stl:\ ,stlnc:\
" set term=xterm-256color
" set termencoding=utf-8

" highlight current column
" set cursorline
hi CursorLine term=bold cterm=bold guibg=Grey40
" set cursorcolumn

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions-=e
    set guitablabel=%M\ %t
endif

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

set undofile                " Save undos after file closes
set undodir=$HOME/.vim/undo " where to save undo histories
set undolevels=1000         " How many undos
set undoreload=10000        " number of lines to save for undo

"open env variables around {} with gf
set isfname+={,}
"filenames never have =, remove from search
set isfname-==
set isfname-=,
set isfname-="

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 2 spaces
set shiftwidth=2
set tabstop=2

" disable all autoindent crap if panicked
nnoremap <F9> :setlocal noai nocin nosi inde=<CR>
" Linebreak on 500 characters
set linebreak
" set textwidth=500

set autoindent "Auto indent
" set smartindent "Smart indent
" set wrap "Wrap lines

" TODO : Encontrar solucion para escribir texto en vim
" Set text files (no extension) to html and set coloumns width
" autocmd BufNewFile,BufRead * if &ft == '' 
"   " set filetype=html
"   set textwidth=10000
"   autocmd VimResized * | set columns=72

" TODO: esto funciona pero jode cuando abres algun readme o logfile
" autocmd BufNewFile,BufRead * if &ft == '' | autocmd VimResized * set columns=80 | hi clear CursorLine

" Move up/down 'soft' lines (long lines which wrap around)
noremap <silent> k gk
noremap <silent> j gj

" easier movement to begininng/end of the line
noremap <silent> H 0
noremap <silent> L $


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Netrw
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap -- :Explore<CR>
" autocmd FileType netrw setl bufhidden=wipe
" autocmd FileType netrw nnoremap q :bp\|bd #<cr>
" delete netrw buffers on exit
let g:netrw_fastbrowse = 0
" remove crap on top
let g:netrw_banner = 0
" show tree like files
" let g:netrw_liststyle = 3
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Disable highlight when <leader>l is pressed
map <silent> <leader>l :noh<cr>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Close the current buffer
" map <leader>c:Bclose<cr>:tabclose<cr>gT
" map <leader>c :bdel<cr>
map <leader>c :bp\|bd #<cr>

" Close all the buffers
map <leader>ba :bufdo bd<cr>

map <leader>k :bnext<cr>
map <leader>j :bprevious<cr>

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers 
try
  " ESTE DA PORCULO CON LOS QUICKFIX, ETC!!
  " set switchbuf=useopen,usetab,newtab
  set switchbuf=useopen
  set showtabline=2
catch
endtry

" Return to last edit position when opening files (You want this!)
" au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
" set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c

" set rtp+=/usr/lib/python3.7/site-packages/powerline/bindings/vim/
set guifont=Liberation\ Mono\ for\ Powerline\ 10 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap VIM 0 to first non-blank character
map 0 ^

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
" map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
" map <leader>sn ]s
" map <leader>sp [s
" map <leader>sa zg
" map <leader>s? z=


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" elaborate and run 
" TODO: should only be available for SV files
map <F4> :! ./run && make <CR>

"swap highlighted text with last deleted text
" xnoremap <C-x> <Esc>`.``gvP``P

" rename file
map <leader>n :call RenameFile()<cr>


" Remove the Windows ^M - when the encodings gets messed up
" noremap <leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Quickly open a buffer for scribble
" map <leader>q :e ~/buffer<cr>

" Quickly open a markdown buffer for scribble
" map <leader>x :e ~/buffer.md<cr>

" Toggle paste mode on and off
" map <leader>pp :setlocal paste!<cr>

 

