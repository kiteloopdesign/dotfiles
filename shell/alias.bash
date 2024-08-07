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

alias grep='grep -i --color=auto'
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
alias bF='du -hs * | sort -rh | head'
alias bf='find . -type f -print0 | xargs -0 du -h | sort -hr | head -20'

# Change console title with argument passed to ct (CSH shite)
# alias ct='echo -ne "\033]0;\!*\007"'

# mount -t iso9660 -o ro,loop,noauto /your/texlive.iso /mnt 
alias isomount='sudo mount -t iso9660 -o ro,loop,noauto $1 /mnt'

# make it easier to understand on what column the file is on
alias comm='comm --output-delimiter="|"'

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
alias lsd='ls -ltr ~/Downloads/'         

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
# alias gd='git diff --difftool="diff -y"'
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
alias cx='chmod +x '
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
alias cb='cd ~/bin'         
alias cdd='cd ~/Downloads/'         

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
# Useful when there's too many different extensions on a folder and what to have a bird's eye of what it is about it
# find "<PATH>" -type f | sed -e '/.*\/[^\/]*\.[^\/]*$/!s/.*/(none)/' -e 's/.*\.//' | LC_COLLATE=C sort | uniq -c
# alias ee="function __ee() { find "$1" -type f | sed -e '/.*\/[^\/]*\.[^\/]*$/!s/.*/(none)/' -e 's/.*\.//' | LC_COLLATE=C sort | uniq -c; unset -f __ee; }; __ee"
alias ee="function __ee() { find . -type f | sed -e '/.*\/[^\/]*\.[^\/]*$/!s/.*/(none)/' -e 's/.*\.//' | LC_COLLATE=C sort | uniq -c; unset -f __ee; }; __ee"

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

# Find duplicated filenames in a folder structure. Eg big mess with pictures
# find . -type f -printf '%p/ %f\n' | sort -k2 | uniq -f1 --all-repeated=separate

# Super one-liner. Shows most used commands. Useful to find out what commands to aliase/automate
# alias mu 'history 0 | awk '{CMD[$2]++;count++;}END { for (a in CMD)print CMD[a] " " CMD[a]/count*100 "% " a;}' | grep -v "./" | column -c3 -s " " -t | sort -nr | nl |  head -n10'

# Allows to use alias with sudo commands
# alias sudo='sudo '

#----------------------------------------------------------------------------------------------------
# Several aliases for tools/software/apps
#----------------------------------------------------------------------------------------------------
alias vncserver='vncserver -geometry 1920x1080'
alias vnckill='vncserver -kill :1'
alias google='chromium-browser &> /dev/null &'
# alias p '$USER/miniconda2/python'
# alias p3 'python'
# alias python='python3.7'
alias i='ipython'
alias p='python3'
# alias feh='feh -. -d --draw-tinted' # Fit to screen images, draw filename
# alias feh='feh --draw-exif --edit --scale-down -d --draw-tinted'
# You can also use exiftool to add in custom exif data... es una puta mierda el exiftool....
# alias feh='feh --info "exiftool -m -p \$DateTimeOriginal %F" --edit --scale-down -d --draw-tinted' 
# alias feh='feh --scale-down -d --draw-tinted --info 'exiftool -m -p "\$DateTimeOriginal \$ApertureValue" %f' IMG_20170122_161232.jpg'
# show size
# alias feh='feh --scale-down -d --draw-tinted --info "du -sh %F"'
# Tambien se puede usar el feh itself para mostrar some basic info (no tanta como con exiftool). eg dimensions
# Ojo con el --edit que al usar "< o >" cambia el md5sum del archivo! mejor usar --auto-rotate
# alias feh='feh -F --draw-exif --edit --scale-down -d --draw-tinted --info "feh -L %wx%h %f"'
alias feh='feh -F --draw-exif --auto-rotate --scale-down -d --draw-tinted --info "feh -L %wx%h %f"'
# alias feh='feh --keep-zoom-vp --draw-exif --auto-rotate --scale-down -d --draw-tinted --info "feh -L %wx%h %f"'

alias f='feh'
alias r='ranger'
alias z='zathura'
alias ytv='ytdl-video'
# alias df 'pydf'
alias pdfreader='evince'
alias oo='libreoffice'
alias pdfgrep='pdfgrep -HRi'
# qmv is in package renameutils
alias qmv='qmv --format=destination-only'

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
# alias hl='hledger date:2023..' # desde 2023 en adelante
# alias hl='hledger expenses' # Usar una account xa q no se vean dobles!
# alias post='vim "+normal G$" +startinsert ~/personal/ledger/data/2022/journal.ldg'
# alias assets='hl b ^assets --flat -X EUR'
# alias expenses='hl -r assets -s -X EUR'
# alias budget='hl b budget --flat -p $( date +%b ) -X EUR'
# alias balance='hl balance --real -X BGN'

# entr: quick debugging of scripts
alias ds='function __ds() { \ls "$1" | entr -s "clear; sh "$1"" ; unset -f __ds; }; __ds'

alias vlc='vlc 2>/dev/null'

# # bat: equivalent to cat/less
# alias cat='bat --paging=never'
# alias bd='bat -l diff'
# # bj='bat -l json'
# alias bm='bat -l man'

# czkawka image de-duplication
# alias cz='czkawka_cli'
# Find duplicate images on current and subfolders
# cz image -d "$PWD" -f results.log

#----------------------------------------------------------------------------------------------------
# Network management/ssh
#----------------------------------------------------------------------------------------------------

alias mypubip='dig +short myip.opendns.com @resolver1.opendns.com'

# ip -brief -color addr
# ip -brief -color route
# sudo nmap -sP 192.168.1.0/24 | grep -i "b8:27:eb\|dc:a6:32" -B2
# arp -a | grep -i "b8:27:eb\|dc:a6:32"

# SSH
# alias kitepi='ssh-add -t 1h;ssh -X kitepi@192.168.0.222'
# alias android='ssh-add -t 1h;ssh 192.168.1.73 -p 2222'

# sudo nmcli connection modify MOVISTAR_PLUS_FDE3 ifname wlp4s0 ipv4.method manual ipv4.addresses 192.168.1.101/24
# sudo nmcli connection modify MOVISTAR_PLUS_FDE3 ifname wlp4s0 ipv4.method auto 

# see ipv4 settings
# sudo nmcli connection show MOVISTAR_FDE3 | ag ipv4

# TODO! atencion al "ifname" !
# sudo nmcli connection modify MOVISTAR_PLUS_FDE3 ifname wlp2s0 ipv4.method manual ipv4.addresses 192.168.1.101/24 gw4 192.168.1.1 ipv4.dns "80.58.61.254 80.58.61.250"
# sudo nmcli connection modify MOVISTAR_PLUS_FDE3 \
#                       ifname wlp2s0 \
#                       ipv4.method manual \
#                       ipv4.addresses 192.168.1.101/24 gw4 192.168.1.1 \
#                       ipv4.dns "80.58.61.254 80.58.61.250"
# sudo nmcli connection modify MOVISTAR_FDE3 ifname wlp2s0 ipv4.dns "80.58.61.254 80.58.61.250"

# sudo nmcli connection modify MOVISTAR_FDE3 ifname wlp2s0 ipv4.dns "192.168.1.101"


# poner de nuevo DHCP auto
# sudo nmcli connection modify MOVISTAR_PLUS_FDE3 ifname wlp2s0 ipv4.method auto

# nmcli connection edit MOVISTAR_PLUS_FDE3
#
# TODO: no consigo hacerlo asi
# sudo nmcli connection add type ethernet con-name 'static-fedora' ifname wlp4s0 ipv4.method manual ipv4.addresses 192.168.1.101/24 gw4 192.168.1.1                                                                                                     
# sudo nmcli con mod 'static-fedora' ipv4.dns 192.168.1.1
# sudo nmcli con up 'static-fedora'

alias router='ssh 1234@192.168.1.1'
# password: JD8ZS1gi

#-------------------------------------------------------------
# X
#-------------------------------------------------------------
# alias logoff='/usr/bin/cinnamon-session-quit --no-prompt'
# TODO: debug
# alias logoff='mate-session-save --logout-dialog'
alias logoff='xfce4-session-logout --logout'

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

# remove passwd from pdf
# qpdf --password=XXXXXX --decrypt RECIBO_2022.pdf RECIBO_2022.nopasswd.pdf

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
  # Assign a default value for resolution
  res=${2:-1080}
  ALREADY_DOWNLOADED="ytd-downloaded.list"
          yt-dlp -S ext:mp4:m4a,res:$res \
          --restrict-filenames \
          --add-metadata \
          --ignore-errors \
          --no-overwrites \
          --download-archive "${ALREADY_DOWNLOADED}" \
          -o '%(title)s.%(ext)s' "$1"
}


# # Download the best mp4 video available, or the best video if no mp4 available
# $ yt-dlp -f "bv*[ext=mp4]+ba[ext=m4a]/b[ext=mp4] / bv*+ba/b"

# # Download the best video with the best extension
# # (For video, mp4 > mov > webm > flv. For audio, m4a > aac > mp3 ...)
# $ yt-dlp -S "ext"


# TODO: tengo q conseguir q salgan menos webm de esos de mierda...
ytdl-video_1 (){
  yt-dlp  -f "bestvideo[height<=1080]+bestaudio" \
          --restrict-filenames \
          --add-metadata \
          --ignore-errors \
          --no-overwrites \
          -o 'exp1_%(title)s.%(ext)s' "$1"
}


# ytdl-audio (){
#   yt-dlp  --restrict-filenames --add-metadata --ignore-errors \
#           -f bestaudio --extract-audio --audio-format mp3 --audio-quality 0 \
#           -o '%(playlist)s/%(playlist_index)s-%(title)s.%(ext)s' "$1"
# }



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

mm-single (){
  mogrify "$1" \
          -resize 1920x1080^ \
          -define preserve-timestamp=true \
          -auto-level -filter Triangle \
          -unsharp 0x0.5 -quality 85 "$1"

}

# convert _1290046.JPG -resize 1920x1080^ -auto-level -normalize -filter Triangle -unsharp 0x0.5 -quality 85 "out"

#NOTE it will overwrite! Using mogrify as the preserve timestamp does not work with convert
mm-fotos-down (){
for file in ./*.jpg; do
  [ -e "$file" ] || continue  
  base="${file%.*}"
  extension="${file#*.}"
  # outfile="${base}.out.${extension}"
  # outfile="${file}" # OVERWRITE


  # resize image while preserving aspect ratio and improving quality
  # convert $file -resize 1920x1080^ -auto-level -normalize -filter Triangle -unsharp 0x0.5 -quality 85 $outfile


  # resize image while preserving aspect ratio and improving quality
  mogrify \
          -monitor \
          -resize 1920x1080^ \
          -define preserve-timestamp=true \
          -auto-level -filter Triangle \
          -unsharp 0x0.5 -quality 85 "${file}"

          # borde
          # -bordercolor White -border 2%x3% -gravity southeast \

          # crea colores muy saturados, quitar
          # -normalize \

done


}

# Hacer un collage de varias imagenes (15 en este caso, en cuadricula de 5x3)
# resizeando cada una a 250px de ancho
# montage -mode concatenate -tile 5x3 *.jpg -resize 250 -unsharp 0x0.5 out.png
# montage -mode concatenate -tile 5x3 *.jpg -resize 300 -unsharp 0.05 collage.jpg
mm-montage(){
  files=(*.jpg)
  # # Check if there are at least 15 files
  # if [ "${#files[@]}" -lt 15 ]; then
  #   echo "Not enough files in the folder."
  #   return
  # fi
  # # Randomly shuffle the array of files
  # shuffled_files=($(shuf -e "${files[@]}"))
  # # Pick the first 15 files
  selected_files=files
  # Print the selected files
  # echo "Randomly selected files:"
  # for file in "${selected_files[@]}"; do
  #   echo "$file"
  # done
  # echo "${selected_files[@]}"
  # montage -monitor -mode concatenate -tile 5x3 "${selected_files[@]}" -auto-orient -resize 300 -unsharp 0.05 collage.jpg
  # 384x5 = 1920
  montage -monitor -mode concatenate -tile 33x24 "${selected_files[@]}" -auto-orient -resize 384 -unsharp 0.05 collage.jpg
}

# convert _1290046.JPG -auto-level -normalize -filter Triangle -quality 85
# -bordercolor White -border 2%x3% -gravity southeast -unsharp 0x1 out.JPG

# Create a random collage of 15 files
mm-montage-random(){
  files=(*.jpg)
  # Check if there are at least 15 files
  if [ "${#files[@]}" -lt 15 ]; then
    echo "Not enough files in the folder."
    return
  fi
  # Randomly shuffle the array of files
  shuffled_files=($(shuf -e "${files[@]}"))
  # Pick the first 15 files
  selected_files=("${shuffled_files[@]:0:15}")
  # Print the selected files
  # echo "Randomly selected files:"
  # for file in "${selected_files[@]}"; do
  #   echo "$file"
  # done
  echo "${selected_files[@]}"
  # montage -monitor -mode concatenate -tile 5x3 "${selected_files[@]}" -auto-orient -resize 300 -unsharp 0.05 collage.jpg
  # 384x5 = 1920
  montage -monitor -mode concatenate -tile 5x3 "${selected_files[@]}" -auto-orient -resize 384 -unsharp 0.05 collage.jpg
}

#----------------------------------------------------------------------------------------------------
# imagenes
#----------------------------------------------------------------------------------------------------

# buscar imagenes gordas y abrirlas con feh
# find . -maxdepth 1 -size +1000k -name IMG-2020\*jpg | sort | feh -f-

# sort by sizes, max dim, ratio
# \feh -S pixels --max-dimension 1000x0 *
# \feh -S width -L "%f:%wx%h:%p" --min-dimension 640x0 --max-dimension 640x0 *
# \feh -S width -L "%f:%wx%h" --min-dimension 640x0 --max-dimension 640x0 *
# \feh -S width -L "%f:%wx%h" --min-dimension 640x0 --max-dimension 640x0 * | wc
# \feh -S pixels -L "%f:%wx%h"
# \feh -S pixels -L "%f:%wx%h:%P"
# if there are a lot of files, this guy is faster ...
#  exiftool -q -p '$filename' -if '$imagewidth<500 or $imageheight<500' . | feh -f -
# actions are possible...
# feh -S pixels --max-dimension 640x0 * -l --action 'rm -f %F'

# print only date tags
# exiftool -time:all -s -G1  _6100261.JPG

# update file timestamps with exif date: happens when copying or resizing, etc
# exiftool  '-FileModifyDate<DateTimeOriginal'

# Print files which file timestamp does not match the exif date. Note they are always (milliseconds and shite) different!
# exiftool -m -p '$directory/$filename / $FileModifyDate / $DateTimeOriginal' -if '$FileModifyDate ne $DateTimeOriginal' _1210035.JPG
# this does the trick as the date is now formatted
#  exiftool -d "%Y%m%d %H:%M:%S" -m -p '$directory/$filename / $FileModifyDate / $DateTimeOriginal' -if '$FileModifyDate ne $DateTimeOriginal'

# putting it all together. Update date only on those pics which do not match
# exiftool -d "%Y:%m:%d %H:%M:%S" '-FileModifyDate<DateTimeOriginal' -if '$FileModifyDate ne $DateTimeOriginal' .

# print filename si no tienen datos GPS
# exiftool -m -p '$directory/$filename' -if 'not $gpslatitude' -r .

# debugueando jpgs en donde las dates estan messed up
# exiftool -p '$directory/$filename' -if 'not defined $datetimeoriginal or $datetimeoriginal =~ /(^\s*$)/' .
# exiftool -p '$directory/$filename' -if 'not defined $datetimeoriginal or $datetimeoriginal =~ /(^\s*$)/' -r .

# Use filename in alldates if no exif data is defined: good for fotos that lost all exif time info
# exiftool -overwrite_original_in_place "-alldates<filename" -if 'not defined $datetimeoriginal or $datetimeoriginal =~ /(^\s*$)/' -r .

# Use to import Olympus OM-D EM5 Pics. Renames files with date and appends old filename to keep track of original files
# exiftool '-FileName<${Datetimeoriginal}_EM5${FileName}' -d 'IMG_%Y%m%d%%+c' *JPG
# exiftool '-TestName<${Datetimeoriginal}_EM5${FileName}' -d 'IMG_%Y%m%d%%+c' *JPG # NOTE Testname can be used to dry-run
# Para cambiar de JPG a jpg ... no muy testeado
# exiftool '-FileName<${Datetimeoriginal}_EM5%f.%le' -d 'IMG_%Y%m%d%%+c' *JPG

# OJO que los .MOV no tienen el mismo tag de date los JPG sino:
# exiftool '-FileName<${CreateDate}_EM5${FileName}' -d 'VID_%Y%m%d%%+c' *MOV
# Usar este para videos que no tengan nombre de entrada (eg mp4 concatenados)
# exiftool '-FileName<${CreateDate}_EM5%f.%le' -d 'VID_%Y%m%d%%+c' concat.mp4

#----------------------------------------------------------------------------------------------------
# exif
#----------------------------------------------------------------------------------------------------

# chequea for issues en los archivos: pero NO me saca los warnings q veo al hacer alguna operacion en los archivos
# eg: Warning: FPXR segment too small 
# exiftool -validate -warning -error -p '$directory/$filename' -if "$error or $warning" *jpg

function exifinfo() { 
  # exiftool -time:all -s -G1  _6100261.JPG
  exiftool -s -G1 "$1"
}

function exifdiff() { 
  diff --side-by-side --width 160 --color <(exiftool -s -G1 $1) <(exiftool -s -G1 $2)
}

# Find PICS not matching SYSTEM date
function xx-find-wrong-system-date-pics(){
  # NOTE the "-m" is to suppress warnings but it doesn't suppress them all.
  exiftool -d "%Y-%m-%d %H:%M:%S" -m -p '$directory/$filename / $FileModifyDate / $DateTimeOriginal' -if '$FileModifyDate ne $DateTimeOriginal' "$@"
  # NOTE : los missmatches se van por segundos. Usando este construct solo encontrara las que se vayan por y/m/d
  # exiftool -d "%Y-%m-%d" -m -p '$directory/$filename / $FileModifyDate / $DateTimeOriginal' -if '$FileModifyDate ne $DateTimeOriginal' "$@"
}

# Fix SYSTEM date by using exif - FOR PICS
function xx-fix-wrong-system-date-pics(){
  xx-find-wrong-system-date-pics "$@"
  read -n 1 -p "Are these names okay? (y/n)" answer
  case ${answer:0:1} in
      y|Y )
          exiftool -d "%Y:%m:%d %H:%M:%S" '-FileModifyDate<DateTimeOriginal' -if '$FileModifyDate ne $DateTimeOriginal' "$@"
      ;;
      * )
          echo "Exiting..."
          return 1
      ;;
  esac
}

# Rename files so they look like IMG_YYYYMMDD_[EM5]<ORIGINAL_FILENAME>.ext
# To be used on pics from other sources other than phone camera/whatsapp
function xx-rename-pics(){
  echo "Processing "$@" files"
  # cam=${1:-"EM5"}
  cam="EM5" # TODO: change if needed
  # echo "camara is $cam"
  exiftool '-TestName<${Datetimeoriginal}_'"$cam"'${FileName}' -d 'IMG_%Y%m%d%%+c' "$@"
  read -n 1 -p "Are these names okay (y/n)" answer
  case ${answer:0:1} in
      y|Y )
          exiftool -v '-FileName<${Datetimeoriginal}_'"$cam"'${FileName}' -d 'IMG_%Y%m%d%%+c' "$@"
      ;;
      * )
          echo "Exiting..."
          return 1
      ;;
  esac
}

# Find short videos
function xx-find-short-vids(){
  exiftool -p '$directory/$filename' -if '$duration#<10' "$@"
}

# PRint video duration
function xx-vid-duration(){
  exiftool -duration# "$1"
}

# Find VIDEOS not matching SYSTEM date
function xx-find-wrong-system-date-vids(){
  exiftool -d "%Y-%m-%d" -m -p '$directory/$filename / $FileModifyDate / $CreateDate' -if '$FileModifyDate ne $CreateDate' "$@"
}

# Fix SYSTEM date by using exif - FOR VIDS
function xx-fix-wrong-system-date-vids(){
  xx-find-wrong-system-date-vids "$@"
  read -n 1 -p "Fix system date on these files? (y/n)" answer
  case ${answer:0:1} in
      y|Y )
          exiftool -d "%Y:%m:%d %H:%M:%S" '-FileModifyDate<CreateDate' -if '$FileModifyDate ne $CreateDate' "$@"
      ;;
      * )
          echo "Exiting..."
          return 1
      ;;
  esac
}


#----------------------------------------------------------------------------------------------------
# ffmpeg
#----------------------------------------------------------------------------------------------------

# el ffprobe da info
# ffprobe P7230031.MOV

## from MOV to mkv encoding with default h264
# ffmpeg -i P2190119.MOV -vcodec h264 -acodec aac out.mkv
## Copia directa de streams, cortando video desde 21' a 3:50'. ATENCION a poner estos dos ANTES del output
# ffmpeg -ss 00:21 -to 03:50 -i out.mkv -c copy trim.mkv


# fijando el tamanyo
# no da buenos resultados
# ffmpeg -i input.mp4 -vcodec libx264 -b 700k output.mp4

# este el q parece que va mejor. rango sano de 17 (menos compresion) a 28 (mas compresion)
# ffmpeg -i input.mp4 -vcodec libx264 -crf 24 output.mp4
# probar el audio
# ffmpeg -i input.mp4 -vcodec libx264 -crf 24 -b:a 96k output.mp4

alias ff='function __ff() { for f in "$@"; do ffmpeg-compress $f; mkdir original; mv $f original; done; unset -f __ff; }; __ff'

# alias ffmpeg-compress='function __ffmpeg-compress() { ffmpeg -i $1 -map_metadata 0 -vcodec libx264 -crf $2 $1.$2.mp4; unset -f __ffmpeg-compress; }; __ffmpeg-compress'
function ffmpeg-compress() {
  # Remove extension
  base="${1%.*}"
  # Assign a default value of 24 if $2 is not present
  crf=${2:-24}
  output=$base.compressed.mp4
  ffmpeg -stats -hide_banner -loglevel error -i $1 -map_metadata 0 -vcodec libx264 -crf $crf $output
}

# ffmepg-compress file.mov [24]
# NOTE it moves the original file!
# Use this for the EM5 videos!
function ffmpeg-compress-mov() { 
  # Assign a default value of 24 if $2 is not present
  crf=${2:-24}
  # Remove extension
  base="${1%.*}"
  output=$base.mp4
  # # Check if the output file already exists. this in case input is mp4 already
  # if [ -e "$base".mp4 ]; then
  #   output="${base}_compressed.mp4"
  # else
  #   output=$base.mp4
  # fi
  duration=$(exiftool '-duration#' "$1" | awk '{sum+=$3} END {print sum}')
  echo "Clip duration is $duration. Expect 2x of that time for MP4 encoding"
  ffmpeg -stats -hide_banner -loglevel error -i $1 -map_metadata 0 -vcodec libx264 -crf $crf $output
  # change system creation date
  exiftool  '-FileModifyDate<CreateDate' $output
  # change filename
  exiftool -v '-FileName<${CreateDate}_EM5%f.%le' -d 'VID_%Y%m%d%%+c' $output
  mkdir original
  echo "Moving original files $@"
  mv "$1" original
}

# ffmpeg-concat video1.mov video2.mov OR ffmpeg-concat *.mov -> note that *.mov will get glob-expanded, function will see expanded files
# all videos MUST use same stream !
# NOTE the mp4 extension on output!
# NOTE the map_metadata will use metadata of 1st file (i think) see https://video.stackexchange.com/questions/23741/how-to-prevent-ffmpeg-from-dropping-metadata
function ffmpeg-concat-and-compress() { 
  echo "Processing "$@" files"
  duration=$(exiftool '-duration#' "$@" | awk '{sum+=$3} END {print sum}')
  echo "Total duration of resultant clip is $duration. Expect 2x of that time for MP4 encoding"
  ffmpeg -stats -hide_banner -loglevel error \
  -f concat -safe 0 -i <(for f in "$@"; do printf "file '$PWD/$f'\n"; done) \
  -map_metadata 0:s:0 \
  -vcodec libx264 -crf 24 concat.mp4
  # change system creation date
  exiftool  '-FileModifyDate<CreateDate' concat.mp4
  # NOTE how I am using 1st file on "$@" in the name, that's the "${1%.*}" part
  # TODO: note P here will be outdated for 2024!
  exiftool '-FileName<${CreateDate}_EM5'"${1%.*}"'.%le' -d 'VID_%Y%m%d%%+c' concat.mp4
  mkdir original
  echo "Moving original files $@"
  for f in "$@"; do mv $f original; done
  }

# TODO: time as args
function ffmpeg-cut() { 
  base="${1%.*}"
  extension="${1#*.}"
  output=$base.cut.$extension
  ffmpeg -hide_banner -stats -loglevel error -ss 00:00 -to 00:21 -i $1 -map_metadata 0 -c copy $output
  exiftool  '-FileModifyDate<CreateDate' "$output"
}

# usando libx265
# ffmpeg -i input.mp4 -vcodec libx265 -crf 28 output.mp4

# resize
# ffmpeg -i input.mp4 -vf "scale=iw/2:ih/2" output.mp4
# ffmpeg -i input.mp4 -vf "scale=trunc(iw/4)*2:trunc(ih/4)*2" output.mp4


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

# rsync --stats -avhrP <source> <target>

# resultados a traves de ssh unos 7Mbits/s
# sent 572,389 bytes  received 13,714,075,857 bytes  6,967,055.24 bytes/sec
# total size is 13,708,800,586  speedup is 1.00


