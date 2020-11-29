#############################################################
# MORE ENVIRONMENTAL VARIABLES
export BIB="$HOME/Documents/LaTeX/refs.bib"
export LMAC="$HOME/Documents/LaTeX/macros.tex"
export BARRACUDA="/mnt/barracuda"
export DROPBOX="/mnt/barracuda/Dropbox"
export PDFS="cd /mnt/barracuda/pdf_db"
export DOTFILES="$HOME/dotfiles"

##############################################################
## COMMANDS
alias ..="cd .."
alias sdn="sudo shutdown -P now"
alias q="exit"
alias :q="exit"
alias v="vim"
# alias sv="sudo vim"
alias r="ranger"
alias p="sudo pacman"
alias mkd='mkdir -pv'
alias Rs="Rscript"
# list files
alias l=' ls -lFh'
alias la='ls -lAFh'
alias lr='ls -tRFh'
alias lt='ls -ltFh'
alias ll='ls -l'

#############################################################
# basic aliases
alias ref="source ~/.bashrc"

alias bashrc="vim ~/dotfiles/bashrc"
alias aliases="vim ~/dotfiles/aliases.sh"
alias vimrc="vim ~/dotfiles/vimrc"
alias vimlatex="vim ~/dotfiles/vimrc_latex.vim"
##############################################################
# SHORTCUTS

alias barracuda="cd $BARRACUDA"
alias drop="cd ~/Dropbox"
alias doing="cd ~/DOING"
alias macro="cd ~/DOING/macro-report/"
alias tese="cd ~/DOING/00-tese/"
alias aulas="cd ~/DOING/Aulas/"
alias quotes="cd ~/DOING/Quotes/"
alias site="cd ~/DOING/site/"
alias cv="cd ~/DOING/CV"
alias lw="cd ~/DOING/LW-SR-VAR/"
alias downloads="cd ~/Downloads && r"
alias tmp="cd ~/DOING/Aulas/tmp/"
alias manr="cd ~/R-mans/ && ranger"
alias emacsfolder="cd ~/.emacs.d/"

##############################################################
# Latex
alias TXa="cp ~/Documents/LaTeX/article.tex"
alias TXb="cp ~/Documents/LaTeX/beamer.tex"
alias TXh="cp ~/Documents/LaTeX/handout.tex"

##############################################################
# Find files
alias fifi=" find . -maxdepth 1 -type f -iname"
alias fifin="find . -maxdepth 1 -type f ! -iname"
alias ld="find . -maxdepth 1 -type d"
# alias lf="find . -maxdepth 1 -type f"

# delete empty files
alias demptyf="find ./ -empty -type d -delete"

##############################################################
# R
# https://www.tidyverse.org/articles/2017/12/workflow-vs-script/
alias R="R --no-save --no-restore-data"

##############################################################
# RSYNC
alias hdexterno="cd /media/paulo && ranger "

# save to dropbox
alias savedoing="rsync -avh --delete ~/DOING $DROPBOX/doing-drop/ryzen"

# seagate-barracuda
alias backmedia="rsync -avh --delete /media/paulo/seagate-barracud /media/paulo/seagate_external/"
alias backvids="rsync -avh --delete /media/paulo/seagate-barracud/Videos /media/paulo/seagate_external/Videos/"

# wd-black
alias backhome="rsync -avh --delete /home/pfn $BARRACUDA/backups/artix/"
alias backdrop="rsync -avh --delete $DROPBOX /media/paulo/wd-black_750/backups/ubuntu-ryzen-dropbox/"

##############################################################
# DOTFILES
alias dotfiles="cd ~/dotfiles"
alias savedotfiles="rsync -avh --delete ~/.emacs.d ~/.bashrc ~/.bash_profile ~/.vimrc ~/.Rprofile ~/.config/ranger/rc.conf ~/.config/i3/config ~/.config/i3/i3blocks.conf ~/.scripts ~/dotfiles/ "
alias backdot="rsync -avh --delete /home/paulo/dotfiles/ $DROPBOX/dotfiles/ryzen/"

alias rangerrc="   vim ~/.config/ranger/rc.conf"
alias i3rc="       vim ~/.config/i3/config"
alias i3blocksrc=" vim ~/.config/i3/i3blocks.conf"
alias emacsrc="    vim ~/.emacs.d/init.el"
alias emacs="emacs -nw" # abrir emacs no terminal
alias rprofile="   vim .Rprofile"

##############################################################
# pdf finder
alias pdfs="cd /mnt/barracuda/pdf_db/"
findpdf() { find /mnt/barracuda/pdf_db/ -iname *$1* ;}
findhere() { find ./ -iname $1 ;} # por maxdepth
findfromhome() { find ~/ -iname $1 ;}
allpdfs() { find -iname '*.pdf' ;}

##############################################################
# $1 é a extensao e $2 é a pasta destino
findandmove() { find $1 -maxdepth 1 -type f -iname "*$2*" -exec mv {} $3 \; ;}
findandmoveext() { find ./ -maxdepth 1 -type f -iname "*.$1" -exec mv {} $2 \; ;}

##############################################################
# config files
alias config="   cd $HOME/.config     && ranger"
alias urxvtrc="    vim $HOME/.Xresources"
alias urxvtload="xrdb ~/.Xresources"

##############################################################
# FOTOS DOC
alias feh1="feh --scale-down --auto-zoom"
alias feh2="feh -d --geometry 1020x1020"

#########################################################################
# surf
alias surf1="surf duckduckgo.com &! q"
alias surf2="tabbed surf -e &! q"
# alias surf3="tabbed surf youtube.com -e &! q" # tbm nao funciona

#########################################################################
# youtube
alias yts="w3m duckduckgo.com"
alias ytv="youtube-viewer"
alias ytd="youtube-dl -ic"
alias ytm="youtube-dl --extract-audio --audio-format mp3"
alias yta="youtube-dl -xic"

#########################################################################
# lukesmith
alias notes="vim ~/notes"

alias mkd="mkdir -pv"
mkcd() { mkdir -pv $1 && cd $1 ;}

alias crep="grep --color=always"

CF() { cd ~/.config/$1 && ls ;}

#########################################################################
alias tirartudo="find ./ -iname * -exec mv {} ../"

mvmp4() { find ./ -iname "*.mp4" -exec mv {} $1 \; ;}

##############################################################
# Volume
vol() { pactl set-sink-volume 1 $1;}

##############################################################
# GIT COMMANDS

alias gitls="git ls-tree --full-tree -r HEAD"
alias gitrmfile="git rm --cached"
alias gitrmfolder="git rm -r --cached"
alias gitcommit="git commit -m"
# gitc() { git commit -m "$1";}

# get git
getgit() { git clone http://github.com/$1.git ;}

##############################################################
# CSGO
alias csgobind="cd ~/.local/share/Steam/steamapps/common/Counter-Strike\ Global\ Offensive/csgo/cfg"
