# Allows to use alias with sudo commands
alias sudo='sudo '

#-------------------
# Global alias
#-------------------
alias -g G='|grep -i'

# FROM ZMV, must be loaded in zshrc
alias zmv='noglob zmv -W'
alias zcp='noglob zmv -C'
alias zln='noglob zmv -L'
alias zsy='noglob zmv -Ls'

#-------------------
# Copy and paste via xclip
#-------------------
alias setclip='xclip -selection c'
alias getclip='xclip -selection c -o'
# $ echo foo | setclip
# $ getclip
# foo
alias pp='pwd | tr "\n" " " | xclip'

#-------------------
# Personnal Aliases
#-------------------
# There is other commands like realpath but it does not exist on tcsh... so we need this crap
# TODO: add shell-guard like so for tcsh. Bash does not accept arguments on aliases. It needs a function
# if $(echo $SHELL == 'usr/bin/tcsh || bin/tcsh ) then
# alias rl='echo `readlink -f \!*` | tr -d "\n" | xclip ; echo \"Copied link \!* to clipboard\"'        

# function __rl() { readlink -z -f $1 | xclip ; echo "Link $1 copied to clipboard" }
# alias rl='__rl'
# Same as a one liner with an auto-destructive function
alias rl='function __rl() { readlink -z -f $1 | xclip ; echo "Link $1 copied to clipboard"; unset -f __rl; }; __rl'
# Open by extension
alias vv='function __vv() { find . -maxdepth 1 -name "*.$1" -type f -exec gvim -v {} \+; unset -f __vv; }; __vv'


# For this to work need $EDITOR pointing to vim 
alias svim='sudoedit'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
# Prevents accidentally clobbering files.
alias mkdir='mkdir -pv'

# Quickly backup file. Use autodestructive function
alias bb='function __bb() { cp -af -- "$1" "$1.bak" ; echo "$1 backed-up"; unset -f __bb; }; __bb'

# alias tldr='tldr find'

#alias history='fc -El 1'
alias h='history 100'
alias hg='history | grep'
alias j='jobs -l'
alias which='type -a'
alias ..='cd ..'
alias cal='cal -m -3'
# Lista de directorios para navegar por ellos. TODO : aun no pirula
alias d='dirs -v | head -20'

# bulk rename! qmv tool from renameutils !!!
alias qmv='qmv -f do'

# Pretty-print of some PATH variables:
alias path='echo -e ${PATH//:/\\n}'
alias libpath='echo -e ${LD_LIBRARY_PATH//:/\\n}'

alias du='du -skh'    # Makes a more readable output.
alias df='df -kTh'

alias doc='ranger ~/docs/'

# Find spaces rescursively
alias sp='find . -type f -name "*[[:space:]]*"'

# SSH
# alias kitepi='ssh-add -t 1h;ssh kitepi@192.168.1.123'
# alias kitepi='ssh-add -t 1h;ssh kitepi@kitepi.hopto.org'
alias kitepi='ssh-add -t 1h;ssh -X kitepi@192.168.0.222'
alias android='ssh-add -t 1h;ssh 192.168.1.73 -p 2222'

alias diff='diff --color'

# print ls aliases using delimiters. NOTE! Escaping the "$" !
alias pla="awk '/## BEGIN LS/ , /## END LS/ { print \$0 }' $HOME/.alias"

## BEGIN LS---------------------------------------------------
# The 'ls' family (this assumes you use a recent GNU ls).
#-------------------------------------------------------------
# Add colors for filetype and  human-readable sizes by default on 'ls':
alias ls='ls -lh --color'
alias le='ls -lXB'         #  Sort by extension.
alias lk='ls -lSr'         #  Sort by size, biggest last.
alias lt='ls -ltr'         #  Sort by date, most recent last.
alias lc='ls -ltcr'        #  Sort by/show change time,most recent last.
alias lu='ls -ltur'        #  Sort by/show access time,most recent last.
alias lx='find . -maxdepth 1 -type f -executable' # list executables
# The ubiquitous 'll': directories first, with alphanumeric sorting:
alias ll='ls -lv --group-directories-first'
alias lm='ll |more'        #  Pipe through 'more'
alias lr='ll -R'           #  Recursive ls.
alias la='lt -A'           #  Show hidden files.
alias lh='ls -Ad .*'       #  Only show hidden files
# alias lf='ls -d .*/ */'    #  Only show folders
alias lf='ls -d */'    #  Only show folders
alias l='lt'
## END LS

#-------------------------------------------------------------
# Network management
#-------------------------------------------------------------
# ip -brief -color addr
# ip -brief -color route
# sudo nmap -sP 192.168.1.0/24 | grep -i "b8:27:eb\|dc:a6:32" -B2
# arp -a | grep -i "b8:27:eb\|dc:a6:32"

#-------------------------------------------------------------
# find
#-------------------------------------------------------------
# find files with given extension recursively
alias fe='function __fe() { find . -type f -name \*.$1 ; unset -f __fe; }; __fe'

# find files with given extension recursively and execute command on them => too dangerous w/o some security checks ...
# find files with given extension recursively and AG on them
# $ fee rules expenses
alias fee='function __fee() { find . -type f -name \*.$1 -exec ag -H $2 {} \; ; unset -f __fee; }; __fee'
# TODO: do it for tcsh
# alias fee=`find . -type f -name \*.`

# When there is a bunch of replicated files that look the same and we want to quickly see 
# whether they are same or different. Find uniq matches on given column with awk 
# find . -name "file_with_same_name" -exec md5sum {} \; | awk '\!_[$1]++'

# show different extensions. Useful when a lot of files in folder
# alias ext='find . -type f | awk -F. '!a[$NF]++{print $NF}''

# Do not traverse into paths. Useful when searching in deep folders eg "/"
# Find all changed files b/w 60 and 10 mins ago. TODO: not sure about the time range, but other than that "prune" is the way
# sudo find . -not \( -path ./home/kitesutra -prune \) -cmin -60 -cmin -10

# Add to bin : Quickly create an script to do something
# alias ab='gvim -c 'set autochdir' ~/bin/'         # Create new file
# alias ab='gvim ~/bin/ +':cd %:h'
# See functions

alias lb='ls ~/bin'        # What was the name of that custom script that did ...
alias cb='cd ~/.local/bin'         
alias cl='cd ~/personal/ledger/data/2021'         
alias cdd='cd ~/Descargas/'         
alias cds='cd ~/sandbox/cpp/'         

# Doesnt search on hidden folders
# alias bigfiles='ls -Sr **/*(.Lm+100)'
# alias bigfiles='find . -type f -size +100M -exec ls -lh {} \;'
# alias bigfolders='du -hs */ | sort -nr | head'
alias bF='du -hs * | sort -rh | head -n 20'
alias bf='find . -type f -print0 | xargs -0 du -h | sort -hr | head -20'

alias tree='tree -Csh'    #  Nice alternative to 'recursive ls' ...
alias t='tree -L 2'
alias cx='chmod +x $*'

# alias el='vim ~/.ledgerrc'

#-------------------------------------------------------------
# File Permissions
#-------------------------------------------------------------
# find . -type d -exec chmod 0755 {} \;
# find . -type f -exec chmod 0644 {} \;
# Change folders and files one liner :
# chmod -R u+rwX,go+rX,go-w .
# chmod -R u+rwX,go+rX-w .

#-------------------------------------------------------------
# Quick edits and re-loads
#-------------------------------------------------------------

# TODO: Mejor que messear con los links usar esto:
# update-alternatives --display vim
# update-alternatives --config  vim

# alias vimd='/usr/bin/vim -u NONE -c "source ~/vtags-3.10/vtags_vim_api.vim" '
alias vimd='/usr/bin/vim -u vimrc'

alias vim='/usr/bin/gvim -v'
alias ez='vim ~/.zshrc'
alias sz='source ~/.zshrc'
alias ea='vim /home/${USER}/.alias'
alias eg='vim /home/${USER}/.gitconfig'
alias sa='source /home/${USER}/.alias'
alias v='vim'
alias g='gvim'
alias ev='vim ~/.vimrc ~/dotfiles/vim/general.vimrc ~/dotfiles/vim/plugins.vimrc'
alias ef='vim ~/dotfiles/config/feh/keys'
alias et='vim ~/.tmux.conf'
# alias ei='vim ~/.config/i3/config'
alias es='vim ~/.config/sway/config'
alias bc='bc -l'
alias em='vim ~/.muttrc'
alias ep='vim ~/.config/mpv/{input.conf,mpv.conf}'
# alias ep='vim ~/.config/mpv/input.conf'
# alias ey='vim ~/.config/youtube-dl/config'
alias ey='vim ~/.config/yt-dlp/config'
alias eh='vim ~/.zhistfile'

#-------------------------------------------------------------
# X
#-------------------------------------------------------------
alias logoff='/usr/bin/cinnamon-session-quit --no-prompt'

#-------------------------------------------------------------
# Other
#-------------------------------------------------------------

# TODO: not sure if i can make the one liner work in bash
# Super one-liner. Shows most used commands. Useful to find out what commands to aliase/automate
# alias mu='history 0 | awk '{CMD[$2]++;count++;}END { for (a in CMD)print CMD[a] " " CMD[a]/count*100 "% " a;}' | grep -v "./" | column -c3 -s " " -t | sort -nr | nl |  head -n10'

function __mu() { 
history 0 | awk '{CMD[$2]++;count++;}\
END { for (a in CMD)print CMD[a] " " CMD[a]/count*100 "% " a;}' | \
grep -v "./" | column -c3 -s " " -t | sort -nr | nl | head -n10
unset -f __mu
};
alias mu='__mu'

# mount -t iso9660 -o ro,loop,noauto /your/texlive.iso /mnt 
alias isomount='sudo mount -t iso9660 -o ro,loop,noauto $1 /mnt'

# debug script using entr !!!!
alias ds='function __ds() { \ls "$1" | entr -s "clear; sh "$1"" ; unset -f __ds; }; __ds'
# \ls example.sh | entr -s 'clear; ./example.sh'

# random words of given length!!
# cat /dev/urandom | tr -dc 'a-z' | fold -w 10 | head -n 1

# experimentar con encontrar palabras !!
# cat /dev/random | tr -dc 'a-z' | fold -w 10  | grep pablo

# gets rid of problem with % on zsh
# cat /dev/urandom | tr -dc 'a-z' | fold -w 10 | head -n 100 ; echo ''

# anyade col numeros!
# cat /dev/urandom | tr -dc 'a-z' | fold -w 5 | nl | head -n 100 ; echo ''

# FUCKING cool (note is not POSIX compliant! tcsh doesnt like it ! )
# le da al script que espera un FILE desde el std out. stdout -> file descriptor.
# no se si esta es la descripcion pero yo lo entiendo asi
# manhattan.sh <(base64 /dev/urandom | nl) 100

# manhattan.sh <(base64 /dev/urandom | nl ) 50 | ag pablo
#
# removes accents ! 
# cat /usr/share/dict/spanish | iconv -t ASCII//TRANSLIT | ag '.*con$' --nocolor | ag 'b|t|c'

# Busca nombres para raspberries
# cat /usr/share/dict/spanish | awk 'length($1)<6' | ag '^[a-z]{2}pi.*$' --no-color | ag '[p|i]'

#-------------------------------------------------------------
# bat ("cat" and "less" alternative)
# see also .bashrc for related "export"s
#-------------------------------------------------------------
# equivalent to cat
alias cat='bat --paging=never'

alias bd='bat -l diff'
# bj='bat -l json'
alias bm='bat -l man'

# examples:
# $ diff x y | bd
# $ a command that outputs JSON | bj
# $ command --help | bm

#-------------------------------------------------------------
# Sofware
#-------------------------------------------------------------
alias google='chromium-browser &> /dev/null &'
# alias y='google-chrome "www.youtube.com" &> /dev/null &'
alias p='python3'
# alias vim='gvim -v'
alias feh='feh -. -d --draw-tinted' # Fit to screen images, draw filename
# alias feh='feh -xZGd -B black --draw-tinted -g 1366x768'
alias df='pydf'
alias pdfreader='evince'
alias m='cmus'
alias z='zathura'
alias r='ranger' # note this is a zsh shell built-in (repeat)
alias f='feh'
alias oo='libreoffice'
alias pdfgrep='pdfgrep -HRi'
# OJO! el noglob ignora el alias ! eg: "noglob yt www.URL.com" no usa el alias de yt!
# alias mpv='noglob mpv --profile=1080p'
# alias mpv='mpv --profile=720p'
alias m='mpv'
# alias yt='youtube-dl'
alias yt='yt-dlp'
# alias yta='youtube-dl -x'
alias agg='ag -g '
alias agl='ag -l '
# alias agg='ag -g'


#-------------------------------------------------------------
# Git
#-------------------------------------------------------------
alias gs='git status '
alias ga='git add '
alias gb='git branch '
alias grs='git restore '
alias gbc='git checkout -b '
alias gf='git fetch '
alias gp='git pull '
alias gc='git commit'
alias gca='git ci-amend'
# alias gd='git diff'
alias gd='git diff --word-diff=color'
alias gdf='git difftool'
alias gh='git hist'
alias ghh='git ghist'

# Git List commands : shows list of files
alias gl='git list-files-last-commit'
alias glc='git list-files-on-given-commit'
# This is useful when theres many commits and want to see all files that changed from COMMIT until current HEAD
# $: gls HEAD~2 , gls a2f145
# alias gls='git list-files-since-commit'
alias gls='git ls-files'

# Git diff commands : shows diffs on files
alias gdl='git diff-files-last-commit'
alias gdc='git diff-files-on-given-commit'
# alias go='git checkout '
# alias gk 'gitk --all&'
# alias gx 'gitx --all'
alias gg='git grep --line-number'
# git add and commit (only adds and commits modified files)
# $: gac "commmit message"
alias gac='git commit -am '

# -- WIP -- WIP -- WIP -- WIP -- WIP -- WIP -- WIP -- WIP -- WIP -- WIP
# To be worked on
alias git-diff-folders='git diff --name-only | xargs -L1 dirname | uniq'
# -- WIP -- WIP -- WIP -- WIP -- WIP -- WIP -- WIP -- WIP -- WIP -- WIP


alias vtags='python ~/vtags-3.10/vtags.py'


#-------------------------------------------------------------
# Watson
#-------------------------------------------------------------
alias ws='watson start'
alias wres='watson restart'
alias wl='watson log -c -R'
alias wr='watson report -c -d'
# alias wl='watson log --no-pager'
alias wp='watson stop'
alias we='watson edit'


#-------------------------------------------------------------
# hledger
#-------------------------------------------------------------
alias hl='hledger'
alias led='hl'

# alias post='vim "+normal G$" +startinsert ~/personal/ledger/data/2022/journal.ldg'
# alias assets='hl b ^assets --flat -X EUR'
# alias expenses='hl -r assets -s -X EUR'
# alias budget='hl b budget --flat -p $( date +%b ) -X EUR'
# alias balance='hl balance --real -X BGN'

#-------------------------------------------------------------

# xrupdate () {
#  curl -s 'https://dskbank.bg/restapi/dsk/GetCurrencyRates?format=json' | 
#  sed -e 's/[{}]/\n/g' -e 's/"//g' | sed -e '2~2d' | 
#  awk  -v date="$(date +"%Y-%m-%d")" -F[,:] 'NF && $4!=0{print "P " date" 00:00:00 "$6" "$4 " BGN"}' >> ~/L/ledger/data/prices.db
# }

#-------------------------------------------------------------
# Functions
#-------------------------------------------------------------
# https://stackoverflow.com/questions/7131670/make-a-bash-alias-that-takes-a-parameter
# ab

# Replace spaces by underscore
# TODO: Understand the excecdir bash, porque el _ y {} si ya esta haciendo el mv ???
despacito () {
find $1 -depth -name '* *' \
    -execdir bash -c 'mv "$1" "${1// /_}"' _ {} \;
}


# Search for a pattern and open it on vim
fag(){
  local line
  line=`ag --nocolor "$1" | fzf` \
    && vim $(cut -d':' -f1 <<< "$line") +$(cut -d':' -f2 <<< "$line")
}

pdf-unencrypt () {
    : "Usage: <file>
Uses ghostscript to rewrite the file without encryption."
    local in="$1"
    # gs -q -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -sOutputFile="${in:r}_unencrypted.pdf" -c .setpdfwrite -f "$in"
    /usr/bin/gs -q -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -sOutputFile="${in:r}_unencrypted.pdf" -f "$in"
}


# # Download the best video available but no better than 480p,
# # or the worst video if there is no video under 480p
# $ yt-dlp -f 'bv*[height<=480]+ba/b[height<=480] / wv*+ba/w'

# Download the best format (video + audio) that is equal to or greater than 720p width. Save this file as video_id.extension (1La4QzGeaaQ.mp4):
# yt-dlp -f "best[height>=720]" https://www.youtube.com/watch?v=1La4QzGeaaQ -o '%(id)s.%(ext)s'


# yt-dlp --format 'best[height<=720] / worst' \
# mi creacion: mejor video <= 720p o peor otro video si esta no existe

# download youtube videos from file
# it will ignore videos already downloaded !!!
ytf (){
  ALREADY_DOWNLOADED="ytd-downloaded.list"

  # TODO: usar el nombre del canal en nombre del archivo para trackearlo. No se si puede hacer con filtros y tal
  # yt-dlp --format 'bv*[height<=720]+ba/b[height<=720] / wv*+ba/w' \ -> produce putos webm 

  yt-dlp --format 'best[height<=720] / worst' \
  --verbose \
  --batch-file "$1" \
  --add-metadata --write-description --download-archive "${ALREADY_DOWNLOADED}" \
  --sleep-requests 1 --ignore-errors --no-continue --no-overwrites \
  --restrict-filenames --output "%(title)s_%(id)s.%(ext)s" 2>&1 | tee output.log

# lo interesante del json parace estar ya en la descripcion de --write-description
# --write-info-json 

}

ytdl-video (){
# youtube-dl -f "bestvideo[height<=1080]+bestaudio" --restrict-filenames --add-metadata --ignore-errors -o '%(title)s.%(ext)s' "$1"
# youtube-dl -f "bestvideo[ext=mp4]+bestaudio[ext=m4a]/mp4" --restrict-filenames --add-metadata --ignore-errors -o '%(title)s.%(ext)s' "$1"
# youtube-dl -f "bestvideo[height<=720,ext=mp4]+bestaudio[ext=m4a]/mp4" --restrict-filenames --add-metadata --ignore-errors -o '%(title)s.%(ext)s' "$1"
# youtube-dl -f "bestvideo[height<=720]+bestaudio/mp4" --restrict-filenames --add-metadata --ignore-errors -o '%(title)s.%(ext)s' "$1"
yt-dlp -f "bestvideo[height<=1080]+bestaudio/mp4" --restrict-filenames --add-metadata --ignore-errors -o '%(title)s.%(ext)s' "$1"
}

ytdl-playlist (){
  youtube-dl --restrict-filenames --add-metadata --ignore-errors -f bestaudio --extract-audio --audio-format mp3 --audio-quality 0 -o '%(playlist)s/%(playlist_index)s-%(title)s.%(ext)s' "$1"
}

ytdl-video-playlist (){
  # youtube-dl -f "bestvideo[height<=1080]+bestaudio" --restrict-filenames --add-metadata --ignore-errors -o '%(playlist)s/%(playlist_index)s-%(title)s.%(ext)s' "$1"
  yt-dlp -f "bestvideo[height<=720]+bestaudio/mp4" --restrict-filenames --add-metadata --ignore-errors -o '%(playlist)s/%(playlist_index)s-%(title)s.%(ext)s' "$1"
}


