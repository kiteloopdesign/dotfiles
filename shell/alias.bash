# Allows to use alias with sudo commands
alias sudo='sudo '

#-------------------
# Global alias
#-------------------
# alias -g G='| grep -i'


# Personnal Aliases
#-------------------

# Git
alias gs='git status '
alias ga='git add '
alias gb='git branch '
alias gf='git fetch '
alias gp='git pull '
alias gc='git commit'
alias gca='git ci-amend'
alias gd='git diff'
alias gdf='git difftool'
alias gh='git hist'
alias ghh='git ghist'
# alias gl='git log'
alias gl='git change'
alias gdc='git diff-files-between-commits'
alias go='git checkout '
alias gg='git grep --line-number'
alias gac='git commit -am '

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
# alias ack='ack -i'
alias ack='ack -i --follow'

alias du='du -skh'
alias df='df -kTh'

# Find spaces rescursively
alias sp='find . -type f -name "*[[:space:]]*"'

#-------------------------------------------------------------
# The 'ls' family (this assumes you use a recent GNU ls).
#-------------------------------------------------------------
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

# show different extensions. Useful when a lot of files in folder
# alias ext 'find . -type f | awk -F. '!a[$NF]++{print $NF}''


# Add to bin : Quickly create an script to do something
# alias ab 'gvim -c 'set autochdir' ~/bin/'         # Create new file
# alias ab 'gvim ~/bin/ +':cd %:h'
# See functions

alias lb='ls ~/scripts'        # What was the name of that custom script that did ...
alias cb='cd ~/scripts'         
# Doesnt search on hidden folders
# alias bigfiles 'ls -Sr **/*(.Lm+100)'
# alias bigfiles 'find . -type f -size +100M -exec ls -lh {} \;'
# alias bigfolders 'du -hs */ | sort -nr | head'
alias bF='du -hs .* * | sort -rh | head'
alias bf='find . -type f -print0 | xargs -0 du -h | sort -hr | head -20'

# alias tree 'tree -Csuh'    #  Nice alternative to 'recursive ls' ...
alias cx='chmod +x $*'


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

#if ( `hostname -s` == raspberry ) then
# ATTENTION !!!!!!!!!!!!!! -X needed because is FREAKING SLOW !!!
#  alias vim='/usr/local/bin/vim -X'
#else
#  alias vim='/usr/local/vim8/bin/vim'
#endif

# TODO: Mejor que messear con los links usar esto:
# update-alternatives --display vim
# update-alternatives --config  vim

# alias vi='\vi -u NONE'
alias vim='gvim -v'
alias vi='vim'
alias ec='vim /home/${USER}/.bashrc'
alias ea='vim /home/${USER}/.alias'
alias eg='vim /home/${USER}/.gitconfig'
alias sa='source /home/${USER}/.alias'
alias v='vim'
alias ev='vim ~/.vimrc ~/dotfiles/vim/general.vimrc ~/dotfiles/vim/plugins.vimrc'
alias bc='bc -l'

#-------------------------------------------------------------
# Other
#-------------------------------------------------------------

# Super one-liner. Shows most used commands. Useful to find out what commands to aliase/automate
# alias mu 'history 0 | awk '{CMD[$2]++;count++;}END { for (a in CMD)print CMD[a] " " CMD[a]/count*100 "% " a;}' | grep -v "./" | column -c3 -s " " -t | sort -nr | nl |  head -n10'


#-------------------------------------------------------------
# Sofware
#-------------------------------------------------------------
alias vncserver='vncserver -geometry 1920x1080'
alias vnckill='vncserver -kill :1'
alias google='chromium-browser &> /dev/null &'
# alias p '$USER/miniconda2/python'
# alias p3 'python'
# alias python='python3.7'
alias i='ipython'
alias p='python3.7'
alias feh='feh -. -d --draw-tinted' # Fit to screen images, draw filename
# alias df 'pydf'
alias pdfreader='evince'
alias f='feh'
alias oo='libreoffice'
alias pdfgrep='pdfgrep -HRi'

#-------------------------------------------------------------
# Functions
#-------------------------------------------------------------

# Change console title with argument passed to ct (CSH shite)
# alias ct='echo -ne "\033]0;\!*\007"'
