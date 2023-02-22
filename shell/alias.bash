#----------------------------------------------------------------------------------------------------
# Handy aliases for built-ins (unless specific section)
#----------------------------------------------------------------------------------------------------
# avoid usual mistake
alias dc='cd'

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
# Prevents accidentally clobbering files.
alias mkdir='mkdir -pv'
# do not print dates on output. It can also be set on bashrc...
# alias HISTTIMEFORMAT=$'\r\e[K' history
alias h='history 100'
alias hg='history | grep'
alias j='jobs -l'
alias cal='cal -m -3'
# Lista de directorios para navegar por ellos. TODO : aun no pirula
alias d='dirs -v | head -20'
alias t='tree -L 2'
# alias tree 'tree -Csuh'    #  Nice alternative to 'recursive ls' ...

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias du='du -skh'
alias df='df -kTh'
alias bc='bc -l'

alias diff='diff --color'

# Pretty-print of some PATH variables:
alias path='echo -e ${PATH//:/\\n}'
alias libpath='echo -e ${LD_LIBRARY_PATH//:/\\n}'

# Find spaces rescursively
alias sp='find . -type f -name "*[[:space:]]*"'

# Doesnt search on hidden folders
# alias bigfiles 'ls -Sr **/*(.Lm+100)'
# alias bigfiles 'find . -type f -size +100M -exec ls -lh {} \;'
# alias bigfolders 'du -hs */ | sort -nr | head'
alias bF='du -hs .* * | sort -rh | head'
alias bf='find . -type f -print0 | xargs -0 du -h | sort -hr | head -20'

# Change console title with argument passed to ct (CSH shite)
# alias ct='echo -ne "\033]0;\!*\007"'

# mount -t iso9660 -o ro,loop,noauto /your/texlive.iso /mnt 
alias isomount='sudo mount -t iso9660 -o ro,loop,noauto $1 /mnt'

## BEGIN LS------------------------------------------------------------------------------------------
# The 'ls' family (this assumes you use a recent GNU ls).
#----------------------------------------------------------------------------------------------------
# Add colors for filetype and  human-readable sizes by default on 'ls':
alias ls='ls -lh --color --time-style long-iso'
alias le='ls -lXB'         #  Sort by extension.
alias lk='ls -lSr'         #  Sort by size, biggest last.
alias lt='ls -ltr'         #  Sort by date, most recent last.
alias lc='ls -ltcr'        #  Sort by/show change time,most recent last.
alias lu='ls -ltur'        #  Sort by/show access time,most recent last.
alias lx='find . -maxdepth 1 -type f -executable' # list executables
# The ubiquitous 'll': directories first, with alphanumeric sorting:
alias ll='ls -lv'
alias lm='ll |more'        #  Pipe through 'more'
alias lr='ll -R'           #  Recursive ls.
alias la='ll -A'           #  Show hidden files.
alias lh='ls -Ad .*'       #  Only show hidden files
# alias lf='ls -d .*/ */'    #  Only show folders
alias lf='ls -d */'    #  Only show folders
alias l='lt'
alias lsd='ls -ltr ~/Descargas/'         

alias lb='ls ~/.local/bin'        # What was the name of that custom script that did ...
## END LS
# print ls aliases using delimiters. NOTE! Escaping the "$" !
alias pls="awk '/## BEGIN LS/ , /## END LS/ { print \$0 }' $HOME/.alias"

#----------------------------------------------------------------------------------------------------
# Git
#----------------------------------------------------------------------------------------------------
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
# TODO: To be worked on
alias git-diff-folders='git diff --name-only | xargs -L1 dirname | uniq'
# -- WIP -- WIP -- WIP -- WIP -- WIP -- WIP -- WIP -- WIP -- WIP -- WIP

#----------------------------------------------------------------------------------------------------
# File Permissions
#----------------------------------------------------------------------------------------------------
alias cx='chmod +x $*'
# find . -type d -exec chmod 0755 {} \;
# find . -type f -exec chmod 0644 {} \;
# Change folders and files one liner :
# chmod -R u+rwX,go+rX,go-w .
# chmod -R u+rwX,go+rX-w .

#----------------------------------------------------------------------------------------------------
# vim
#----------------------------------------------------------------------------------------------------

#if ( `hostname -s` == raspberry ) then
# ATTENTION !!!!!!!!!!!!!! -X needed because is FREAKING SLOW !!!
#  alias vim='/usr/local/bin/vim -X'
#else
#  alias vim='/usr/local/vim8/bin/vim'
#endif

alias vim='gvim -v'
# alias vim='/usr/bin/gvim -v'
alias vi='vim'
alias v='vim'
# alias vi='\vi -u NONE'
# alias vimd='/usr/bin/vim -u NONE -c "source ~/vtags-3.10/vtags_vim_api.vim" '
# alias vimd='/usr/bin/vim -u vimrc'

# TODO: Mejor que messear con los links usar esto:
# update-alternatives --display vim
# update-alternatives --config  vim

# vim ghost-server. Allows to use vim to write and this text immediately 'mirrors' on the browser
# https://github.com/raghur/vim-ghost
alias vs='gvim '
 
#----------------------------------------------------------------------------------------------------
# Quick edits and re-loads
#----------------------------------------------------------------------------------------------------

alias ea='vim /home/${USER}/.alias'
alias eg='vim /home/${USER}/.gitconfig'
alias sa='source /home/${USER}/.alias'
alias ev='vim ~/.vimrc ~/dotfiles/vim/general.vimrc ~/dotfiles/vim/plugins.vimrc'
alias ef='vim ~/dotfiles/config/feh/keys'
alias et='vim ~/.tmux.conf'
# alias ei='vim ~/.config/i3/config'
alias es='vim ~/.config/sway/config'
alias em='vim ~/.muttrc'
alias ep='vim ~/.config/mpv/{input.conf,mpv.conf}'
# alias ep='vim ~/.config/mpv/input.conf'
alias ey='vim ~/.config/yt-dlp/config'
alias eh='vim ~/.bash_history'
alias ez='vim ~/.zshrc'
alias sz='source ~/.zshrc'

alias eb='vim /home/${USER}/.bashrc'
alias ea='vim /home/${USER}/.alias'
alias eg='vim /home/${USER}/.gitconfig'
alias sa='source /home/${USER}/.alias'

# Quick cd's
alias cb='cd ~/.local/bin'         
alias cdd='cd ~/Descargas/'         

#----------------------------------------------------------------------------------------------------
# Find command
#----------------------------------------------------------------------------------------------------
# show different extensions. Useful when a lot of files in folder
# alias ext 'find . -type f | awk -F. '!a[$NF]++{print $NF}''

# find files with given extension recursively
alias fe='function __fe() { find . -type f -name \*.$1 ; unset -f __fe; }; __fe'

# find files with given extension recursively and execute command on them => too dangerous w/o some security checks ...
# find files with given extension recursively and AG on them
# $ fee rules expenses
alias fee='function __fee() { find . -type f -name \*.$1 -exec ag -H $2 {} \; ; unset -f __fee; }; __fee'

# When there is a bunch of replicated files that look the same and we want to quickly see 
# whether they are same or different. Find uniq matches on given column with awk 
# find . -name "file_with_same_name" -exec md5sum {} \; | awk '\!_[$1]++'

# Do not traverse into paths. Useful when searching in deep folders eg "/" Find
# all changed files b/w 60 and 10 mins ago. TODO: not sure about the time
# range, but other than that "prune" is the way
# sudo find . -not \( -path ./home/kitesutra -prune \) -cmin -60 -cmin -10

# Shows different extensions on <PATH> and its number 
# find "<PATH>" -type f | sed -e '/.*\/[^\/]*\.[^\/]*$/!s/.*/(none)/' -e 's/.*\.//' | LC_COLLATE=C sort | uniq -c
alias ee="function __ee() { find "$1" -type f | sed -e '/.*\/[^\/]*\.[^\/]*$/!s/.*/(none)/' -e 's/.*\.//' | LC_COLLATE=C sort | uniq -c; unset -f __ee; }; __ee"

#----------------------------------------------------------------------------------------------------
# Other util one-liners (more complex and may need of non-built-in tools)
#----------------------------------------------------------------------------------------------------
alias pp='pwd | tr "\n" " " | xclip'

# Same as a one liner with an auto-destructive function
alias rl='function __rl() { readlink -z -f $1 | xclip ; echo "Link $1 copied to clipboard"; unset -f __rl; }; __rl'

# Open by extension
alias vv='function __vv() { find . -maxdepth 1 -name "*.$1" -type f -exec gvim -v {} \+; unset -f __vv; }; __vv'
# Quickly backup file. Use autodestructive function
alias bb='function __bb() { cp -af -- "$1" "$1.bak" ; echo "$1 backed-up"; unset -f __bb; }; __bb'

# Super one-liner. Shows most used commands. Useful to find out what commands to aliase/automate
# alias mu 'history 0 | awk '{CMD[$2]++;count++;}END { for (a in CMD)print CMD[a] " " CMD[a]/count*100 "% " a;}' | grep -v "./" | column -c3 -s " " -t | sort -nr | nl |  head -n10'

# Allows to use alias with sudo commands
# alias sudo='sudo '

#----------------------------------------------------------------------------------------------------
# Several aliases for tools/software
#----------------------------------------------------------------------------------------------------
alias vncserver='vncserver -geometry 1920x1080'
alias vnckill='vncserver -kill :1'
alias google='chromium-browser &> /dev/null &'
# alias p '$USER/miniconda2/python'
# alias p3 'python'
# alias python='python3.7'
alias i='ipython'
alias p='python3'
alias feh='feh -. -d --draw-tinted' # Fit to screen images, draw filename
alias f='feh'
alias r='ranger'
alias z='zathura'
alias ytv='ytdl-video'
# alias df 'pydf'
alias pdfreader='evince'
alias oo='libreoffice'
alias pdfgrep='pdfgrep -HRi'

# ag / ack
alias agg='ag -g '
alias agl='ag -l '
# alias agg='ag -g'
# alias ack='ack -i'
alias ack='ack -i --follow'

# Watson
alias ws='watson start'
alias wres='watson restart'
alias wl='watson log -c -R'
alias wr='watson report -c -d'
# alias wl='watson log --no-pager'
alias wp='watson stop'
alias we='watson edit'

# hledger
alias hl='hledger'
alias led='hl'
# alias post='vim "+normal G$" +startinsert ~/personal/ledger/data/2022/journal.ldg'
# alias assets='hl b ^assets --flat -X EUR'
# alias expenses='hl -r assets -s -X EUR'
# alias budget='hl b budget --flat -p $( date +%b ) -X EUR'
# alias balance='hl balance --real -X BGN'

# entr: quick debugging of scripts
alias ds='function __ds() { \ls "$1" | entr -s "clear; sh "$1"" ; unset -f __ds; }; __ds'

# # bat: equivalent to cat/less
# alias cat='bat --paging=never'
# alias bd='bat -l diff'
# # bj='bat -l json'
# alias bm='bat -l man'

#----------------------------------------------------------------------------------------------------
# Network management/ssh
#----------------------------------------------------------------------------------------------------
# ip -brief -color addr
# ip -brief -color route
# sudo nmap -sP 192.168.1.0/24 | grep -i "b8:27:eb\|dc:a6:32" -B2
# arp -a | grep -i "b8:27:eb\|dc:a6:32"

# SSH
# alias kitepi='ssh-add -t 1h;ssh -X kitepi@192.168.0.222'
# alias android='ssh-add -t 1h;ssh 192.168.1.73 -p 2222'

#-------------------------------------------------------------
# X
#-------------------------------------------------------------
# alias logoff='/usr/bin/cinnamon-session-quit --no-prompt'
# TODO: debug
alias logoff='mate-session-save --logout-dialog'

#----------------------------------------------------------------------------------------------------
# TODO/doc/crazy shite/WIP
#----------------------------------------------------------------------------------------------------
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

#----------------------------------------------------------------------------------------------------
# Functions
#----------------------------------------------------------------------------------------------------

despacito () {
find $1 -depth -name '* *' \
    -execdir bash -c 'mv "$1" "${1// /_}"' _ {} \;
}

function __mu() { 
history 0 | awk '{CMD[$2]++;count++;}\
END { for (a in CMD)print CMD[a] " " CMD[a]/count*100 "% " a;}' | \
grep -v "./" | column -c3 -s " " -t | sort -nr | nl | head -n10
unset -f __mu
};
alias mu='__mu'

pdf-unencrypt () {
    : "Usage: <file>
Uses ghostscript to rewrite the file without encryption."
    local in="$1"
    # gs -q -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -sOutputFile="${in:r}_unencrypted.pdf" -c .setpdfwrite -f "$in"
    /usr/bin/gs -q -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -sOutputFile="${in:r}_unencrypted.pdf" -f "$in"
}

# # Search for a pattern and open it on vim
# fag(){
#   local line
#   line=`ag --nocolor "$1" | fzf` \
#     && vim $(cut -d':' -f1 <<< "$line") +$(cut -d':' -f2 <<< "$line")
# }


#----------------------------------------------------------------------------------------------------
# youtube downloader
#----------------------------------------------------------------------------------------------------

# # Download the best video available but no better than 480p,
# # or the worst video if there is no video under 480p
# $ yt-dlp -f 'bv*[height<=480]+ba/b[height<=480] / wv*+ba/w'

# Download the best format (video + audio) that is equal to or greater 
# than 720p width. Save this file as video_id.extension (1La4QzGeaaQ.mp4):
# yt-dlp -f "best[height>=720]" https://www.youtube.com/watch?v=1La4QzGeaaQ -o '%(id)s.%(ext)s'

# yt-dlp --format 'best[height<=720] / worst' \
# mi creacion: mejor video <= 720p o peor otro video si esta no existe

# download youtube videos from file. It will ignore videos already downloaded
# NOTE the defautls for video and audio are not good. Es mas para bajar videos
# en plan hoarder y no tener que preocuparse mucho por lo que ocupan
ytdl-filelist (){
  ALREADY_DOWNLOADED="ytd-downloaded.list"

  # TODO: usar el nombre del canal en nombre del archivo para trackearlo. No se si puede hacer con filtros y tal
  # yt-dlp --format 'bv*[height<=720]+ba/b[height<=720] / wv*+ba/w' \ -> produce putos webm 

  # yt-dlp  --format 'best[height<=1080] / worst' \

  yt-dlp  --format 'best[height<=720] / worst' \
          --verbose \
          --batch-file "$1" \
          --add-metadata --write-description --download-archive "${ALREADY_DOWNLOADED}" \
          --sleep-requests 1 --ignore-errors --no-continue --no-overwrites \
          --restrict-filenames --output "%(title)s_%(id)s.%(ext)s" 2>&1 | tee output.log

# lo interesante del json parace estar ya en la descripcion de --write-description
# --write-info-json 
}

# ytdl-video (){
#   yt-dlp  -f "bestvideo[height<=1080]+bestaudio/mp4" --restrict-filenames \
#           --add-metadata --ignore-errors -o '%(title)s.%(ext)s' "$1"
# }

ytdl-video (){
  ALREADY_DOWNLOADED="ytd-downloaded.list"
  yt-dlp  -f "bestvideo[height<=1080]+bestaudio/mp4" \
          --restrict-filenames \
          --add-metadata \
          --ignore-errors \
          --no-overwrites \
          --download-archive "${ALREADY_DOWNLOADED}" \
          -o '%(title)s.%(ext)s' "$1"
}

# TODO: tengo q conseguir q salgan menos webm de esos de mierda...
ytdl-video_1 (){
  yt-dlp  -f "bestvideo[height<=1080]+bestaudio" \
          --restrict-filenames \
          --add-metadata \
          --ignore-errors \
          --no-overwrites \
          -o 'exp1_%(title)s.%(ext)s' "$1"
}



ytdl-audio-playlist (){
  yt-dlp  --restrict-filenames --add-metadata --ignore-errors \
          -f bestaudio --extract-audio --audio-format mp3 --audio-quality 0 \
          -o '%(playlist)s/%(playlist_index)s-%(title)s.%(ext)s' "$1"
}

ytdl-video-playlist (){

  yt-dlp  -f "bestvideo[height<=1080]+bestaudio" \
          --restrict-filenames --add-metadata --ignore-errors \
          -o '%(playlist)s/%(playlist_index)s-%(title)s.%(ext)s' "$1"

  # yt-dlp  -f "bestvideo[height<=720]+bestaudio/mp4" \
  #         --restrict-filenames --add-metadata --ignore-errors \
  #         -o '%(playlist)s/%(playlist_index)s-%(title)s.%(ext)s' "$1"

}

#----------------------------------------------------------------------------------------------------
# Imagemagick
#----------------------------------------------------------------------------------------------------

# convert _1290046.JPG -resize 1920x1080^ -auto-level -normalize -filter Triangle -unsharp 0x0.5 -quality 85 "out"
mm-fotos-down (){
for file in ./*; do
  [ -e "$file" ] || continue  
  base="${file%.*}"
  extension="${file#*.}"
  # outfile="${base}.out.${extension}"
  outfile="${file}" # OVERWRITE


  # resize image while preserving aspect ratio and improving quality
  # convert $file -resize 1920x1080^ -auto-level -normalize -filter Triangle -unsharp 0x0.5 -quality 85 $outfile


  # resize image while preserving aspect ratio and improving quality
  convert "${file}" \
          -resize 1920x1080^ \
          -auto-level -normalize -filter Triangle \
          -bordercolor White -border 2%x3% -gravity southeast \
          -unsharp 0x0.5 -quality 85 "${outfile}"

done

}

# convert _1290046.JPG -auto-level -normalize -filter Triangle -quality 85
# -bordercolor White -border 2%x3% -gravity southeast -unsharp 0x1 out.JPG

#----------------------------------------------------------------------------------------------------
# ffmpeg
#----------------------------------------------------------------------------------------------------

## from MOV to mkv encoding with default h264
# ffmpeg -i P2190119.MOV -vcodec h264 -acodec aac out.mkv
## Copia directa de streams, cortando video desde 21' a 3:50'. ATENCION a poner estos dos ANTES del output
# ffmpeg -ss 00:21 -to 03:50 -i out.mkv -c copy trim.mkv

#----------------------------------------------------------------------------------------------------
# Accediendo al android
#----------------------------------------------------------------------------------------------------
# Usar simplessh (not so simple, mas bien una puta miera de explicacion, para gordos frikis de mierda)
# En cualquier caso (una vez setupeado para usar clave publica, sino lo has hecho lee http://www.galexander.org/software/simplesshd/)

# abre la app en el phone y te dara la IP. Usa la ip en el comando (notar el puerto q no es el default)
# como alternativa (eg con ip statica, editar el .ssh/config del cliente para forzar el puerto para ese host)
# ssh 192.168.1.42 -p 2222

# IMPORTANTE: si el telf se lockea la ssh peta !! mantener la app en el telefono en 1er plano! (conyazo)

# /sdcard/Android/media/com.whatsapp/WhatsApp/Media/WhatsApp\ Video
# /sdcard/Pictures
# fotos aqui
# /sdcard/DCIM/Camera

# host=192.168.1.228
# rsync --progress -ave 'ssh -p 2222' "root@${host}:/sdcard/DCIM/OpenCamera" .

# esto funciona 100% testeado

# rsync --progress --size-only -ave 'ssh -p 2222' \
# user@192.168.1.42://sdcard/Android/media/com.whatsapp/WhatsApp/Media/ .

# resultados a traves de ssh unos 7Mbits/s
# sent 572,389 bytes  received 13,714,075,857 bytes  6,967,055.24 bytes/sec
# total size is 13,708,800,586  speedup is 1.00


