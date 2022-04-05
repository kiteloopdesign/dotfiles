# Allows to use alias with sudo commands
alias sudo 'sudo '

# ssh
# pm configuration -l mxtdm 3.0-dev -N dev_all_ip
# projsearch -project mxtdm -variant 3.0-dev -config "dev_all_ip" -describe

# Super find example
# find -L s22sc7t*/syn/ -name "*0p81*n40*.lib" -exec grep -H PVH {} \;

# show all DDCs of some product
# show_configs.pl -p tviibh16m -var dev -config dev_all_ip

#----------------previously source from
# override alias in
# source $IRDC_TOOLS/env/.alias
# alias iadd          'icmp4 add \!*'
# alias iadd_all      'find . -type f -print | icmp4 -x - add'
# alias idelete       'icmp4 delete \!*'
# alias idelete_all   'find . -type f -print | icmp4 -x - delete'
# alias iedit         'icmp4 edit \!*'
# alias ihave         'icmp4 have'
# show only changed files
alias idiff         'icmp4 diff -Od'

# alias echo_first  'echo \!^' # Eq. to \!:1
# alias echo_second 'echo \!:2'
# alias echo_all    'echo \!*'

# p4 print -q file#1 > out

# use this guy to revert local files done w/o opening file
# p4 reconcile

# p4 diff tool is controlled by env variable P4DIFF. Only way I know of 
# changing this on the fly is to change the env variable ...
alias p4difftool 'unsetenv P4DIFF; setenv P4DIFF \!:1'

alias p4df 'p4 diff \!*'
alias p4dff 'p4 diff -Od ...'
# list *changed* (meaning they have been opened!) files
alias p4dfl 'icmp4 diff -Od -sa \!*'


# GREPPING P4 output !!
# 2&>1 redirection does NOT work on tcsh !!!
# use this little old trick !
# p4 sync -n |& grep -v up-to-date

# list last 5 changes
# p4 changes -m5 ...


# equivalent to p4 diff2 FILE#1 FILE#2 TODO
# $ p4df FILE 4 5 -> p4 diff2 FILE#4 FILE#5 -> pass tp tkdiff
# alias p4df 'p4 diff2 ....'
# alias p4df 'p4 print \!:1; echo "version \!:2"'
# alias p4df 'echo "file \!:1"; echo "version#\!:2"'
# seguir ...
# alias p4df 'p4 diff2 "file \!:1#\!:2 file \!:1#\!:3"'

#alias irevert       'icmp4 revert \!*'
# revert only unchanged
# p4 revert -a

#alias isubmit       'icmp4 submit \!*'
#alias ifilelog      'icmp4 filelog \!*'
#alias iopened       'icmp4 opened \!*'
#alias isync         'icmp4 sync \!*'
#alias iopened_all   'icmp4 opened -a //depot/icm/proj/\!*/dev/...'
alias p4            'icmp4'
#alias p4o           'iopened'
#alias p4d           'idiff'
#alias p4e           'iedit'
#alias p4h           'ihave'
#alias p4s           'icmp4 submit -d'
alias p4l           'icmp4 filelog -Lt \!*'
#alias p4u           'icmp4 unmanaged -.'
#alias p4ad          'iadd_all'
#alias p4dd          'idelete_all'


#############################################
# MORE advanced commands
#############################################
# Shows files on changelist number
# p4 describe -s 14206747
# Its a cleaner filelog alternative
# p4 changes file.v

#-------------------
# tools
#-------------------
# TODO : maybe use  DMWA_IP
# alias cdd 'proj && \cd ${DMWA}/${PROJECT}/\*'

alias rtl 'proj && cd ${DMWA}/${PROJECT}/rtl'
alias fv 'proj && cd ${DMWA}/${PROJECT}/fv'
alias lint 'proj && cd ${DMWA}/${PROJECT}/lint'
alias cdc 'proj && cd ${DMWA}/${PROJECT}/lint'
alias syn 'proj && cd ${DMWA}/${PROJECT}/syn'
alias dft 'proj && cd ${DMWA}/${PROJECT}/dft'
alias mvrc 'proj && cd ${DMWA}/${PROJECT}/mvrc'
alias atpg 'proj && cd ${DMWA}/${PROJECT}/atpg'
alias tb 'cd ${DMWA}/${PROJECT}/tb/fnv/run'
alias akav 'cd /proj/gpfs/USER/WA/AUDIO_IP/akav_mxtdm_2.2-dev_76/mxtdm'
alias abre 'cd /proj/gpfs/USER/WA/MXPERI/abre_m7cpuss_ver2_dev_87/'
alias config 'cd ${DMWA}/${PROJECT}/../config'
alias peri        'projsetwa dev_21'
# alias projgold    'projsetwa dev_20'
# alias projscratch 'projsetwa dev_22'

# alias rl 'echo `readlink -f \!*` | tr -d "\n" | xclip | echo \"Copied `readlink -f \!*` to clipboard\"'
alias rl 'echo `readlink -f \!*` | tr -d "\n" | xclip ; echo \"Copied link \!* to clipboard\"'



#-------------------
# move b/w long paths with same hierarchy except for one folder name
#-------------------
# eg move from
# /proj/gpfs/USER/USER.0-dev_2/mxtdm/syn/mxtdm_top/run
# to
# /proj/gpfs/USER/USER.0-dev_2/mxtdm/syn.back/mxtdm_top/run
# sed -n -e 's/^foobar \([[:alnum:]]\+\).*/\1/p'
# sed -n "s/^.*foobar\s*\(\S*\).*$/\1/p"
# awk '$1 == "foobar" {print $2}'
# alias cdd 'pwd | sed -n "s/^.*foobar\s*\(\S*\).*$/\1/p"'
alias cdd 'set var1=\!:1; set var2=\!:2; echo $var2'


# Personnal Aliases
#-------------------

# avoid usual mistake
alias dc cd

alias pp 'echo `pwd -L` | tr -d "\n" | xclip ; echo \"Copied pwd to clipboard\"'

# For this to work need $EDITOR pointing to vim 
alias rm 'rm -i'
alias cp 'cp -i'
alias mv 'mv -i'
# Prevents accidentally clobbering files.
alias mkdir 'mkdir -pv'

# alias tldr 'tldr find'

#alias history 'fc -El 1'
# alias grep 'grep -i'
# alias g 'grep -inRHP --color=always $1 $2'
alias g 'grep -inRHP --color=always \!:1'
alias gi 'grep -nRHP --color=always \!:1'
alias gg 'grep -inHP --color=always \!:1 *'
alias ggi 'grep -nHP --color=always \!:1 *'
# alias f 'find . -name "*\!1*"'
# alias f 'find . -name "*$1*"'
# alias find 'find . -name \!1'
# alias grep 'grep -i \!* *'
alias h 'history 100'
alias hg 'history | grep'
alias j 'jobs -l'
alias cal 'cal -m -3'
# Lista de directorios para navegar por ellos. TODO : aun no pirula
alias d 'dirs -v | head -20'
# alias t 'tree -L 2'
alias t 'tree -L 10'
alias agl 'ag -l'
alias agg 'ag -g \!:1'

# Pretty-print of some PATH variables:
# alias path 'echo -e ${PATH//:/\\n}'
# alias libpath 'echo -e ${LD_LIBRARY_PATH//:/\\n}'

# set COLUMNS=80
# alias diff 'diff --expand-tabs --width=$COLUMNS --suppress-common-lines --side-by-side'
alias diff 'diff --expand-tabs --width=80 --suppress-common-lines --side-by-side'
# alias diff 'diff --color'

alias du 'du -skh'    # Makes a more readable output.
alias df 'df -kTh'

# Find spaces rescursively
alias sp 'find . -type f -name "*[[:space:]]*"'

#-------------------------------------------------------------
# The 'ls' family (this assumes you use a recent GNU ls).
#-------------------------------------------------------------
# Add colors for filetype and  human-readable sizes by default on 'ls':
alias ls 'ls -lh --color --time-style long-iso'
alias l 'lt'
alias le 'ls -lXB'         #  Sort by extension.
alias lk 'ls -lSr'         #  Sort by size, biggest last.
alias lt 'ls -ltr'         #  Sort by date, most recent last.
alias lc 'ls -ltcr'        #  Sort by/show change time,most recent last.
alias lu 'ls -ltur'        #  Sort by/show access time,most recent last.
alias lx 'find . -maxdepth 1 -type f -executable' # list executables
# The ubiquitous 'll': directories first, with alphanumeric sorting:
alias ll "ls -lv"
alias lm 'll |more'        #  Pipe through 'more'
alias lr 'll -R'           #  Recursive ls.
alias la 'll -A'           #  Show hidden files.
alias lh 'ls -Ad .*'       #  Only show hidden files
# alias lf 'ls -d .*/ */'    #  Only show folders
alias lf 'ls -d */'    #  Only show folders

# show different extensions. Useful when a lot of files in folder
# alias ext 'find . -type f | awk -F. '!a[$NF]++{print $NF}''


# Add to bin : Quickly create an script to do something
# alias ab 'gvim -c 'set autochdir' ~/bin/'         # Create new file
# alias ab 'gvim ~/bin/ +':cd %:h'
# See functions

alias lb 'ls ~/bin'        # What was the name of that custom script that did ...
alias cb 'cd ~/bin'         
alias cs 'cd /proj/gpfs/user/sandbox'

# Doesnt search on hidden folders
# alias bigfiles 'ls -Sr **/*(.Lm+100)'
# alias bigfiles 'find . -type f -size +100M -exec ls -lh {} \;'
# alias bigfolders 'du -hs */ | sort -nr | head'
alias bF 'du -hs .* * | sort -rh | head'
alias bf 'find . -type f -print0 | xargs -0 du -h | sort -hr | head -20'

# alias tree 'tree -Csuh'    #  Nice alternative to 'recursive ls' ...
alias cx 'chmod +x $*'


#-------------------------------------------------------------
# File Permissions
#-------------------------------------------------------------
# find . -type d -exec chmod 0755 {} \;
# find . -type f -exec chmod 0644 {} \;
# Change folders and files one liner :
# chmod -R u+rwX,go+rX,go-w .
# chmod -R u+rwX,go+rX-w .


#-------------------------------------------------------------
# Watson
#-------------------------------------------------------------
alias ws 'watson start'
alias wres 'watson restart'
# alias wl 'watson log -c -R'
alias wl 'watson --no-color log -c -R'
alias wr 'watson report -c -d'
alias wd 'watson --no-color remove '
# alias wl 'watson log --no-pager'
alias wp 'watson stop'
alias we 'watson edit'

#-------------------------------------------------------------
# Quick edits and re-loads
#-------------------------------------------------------------
# alias vim '$HOME/bin/vim'
alias vim '$HOME/bin/gvim -v'
alias vi '\vi -u NONE'
# alias gvim '$HOME/.local/bin/gvim'
alias gvim 'vim'
alias ec 'vim /home/${USER}/.cshrc'
alias ea 'vim /home/${USER}/.alias'
alias ew 'vim /home/${USER}/.config/watson/config'
alias sa 'source /home/${USER}/.alias'
alias v 'vim'
alias ev 'vim ~/.vimrc ~/dotfiles/vim/general.vimrc ~/dotfiles/vim/plugins.vimrc'
alias bc 'bc -l'
# Find files with given extension
alias ff 'find . -maxdepth 1 -name "*.\!:1" -type f'
# Find files with given extension and open in vim
# alias vv 'find . -maxdepth 1 -name "*.\!:1" -type f -exec vim {} \+'
alias vv 'find . -maxdepth 1 -name "*.\!:1" -type f -exec $HOME/bin/gvim -v {} \+'

#-------------------------------------------------------------
# X
#-------------------------------------------------------------
# alias logoff '/usr/bin/cinnamon-session-quit --no-prompt'

#-------------------------------------------------------------
# Other
#-------------------------------------------------------------

# Super one-liner. Shows most used commands. Useful to find out what commands to aliase/automate
# alias mu 'history 0 | awk '{CMD[$2]++;count++;}END { for (a in CMD)print CMD[a] " " CMD[a]/count*100 "% " a;}' | grep -v "./" | column -c3 -s " " -t | sort -nr | nl |  head -n10'


#-------------------------------------------------------------
# Sofware
#-------------------------------------------------------------
alias vncserver 'vncserver -geometry 1920x1080'
# alias vncserver 'vncserver -geometry 1280x720'
alias vnckill 'vncserver -kill :1'
alias google 'chromium-browser &> /dev/null &'
# alias y 'google-chrome "www.youtube.com" &> /dev/null &'
# alias p '$USER/miniconda2/python'
alias python  /tools/apps/python/bin/python3.6
alias pip     /tools/apps/python/bin/pip3.6
alias p 'python'

# alias feh 'feh -. -d --draw-tinted' # Fit to screen images, draw filename
# aliasÂ feh 'feh -xZGd -B black --draw-tinted -g 1366x768'
# alias df 'pydf'
alias pdfreader 'evince'
# alias f 'feh'
alias oo 'libreoffice'
alias pdfgrep 'pdfgrep -HRi'

#-------------------------------------------------------------
# tcsh/csh "Functions"
#-------------------------------------------------------------

# Change console title with argument passed to ct (CSH shite)
alias ct 'echo -ne "\033]0;\!*\007"'


