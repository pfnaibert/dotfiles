#!/bin/bash
# ref_dotfiles.sh
# this function pulls my github dotfiles, copies them to the appropriate folders, then sources the .bashrc

# git -C ~/dotfiles pull 

cp ~/dotfiles/.bashrc ~/.bashrc
cp ~/dotfiles/.vimrc ~/.vimrc
cp ~/dotfiles/.Rprofile ~/.Rprofile
cp ~/dotfiles/.gitconfig ~/.gitconfig
cp ~/dotfiles/i3/config ~/.config/i3/config

rsync -avh ~/dotfiles/.scripts/ ~/.scripts/

source ~/.bashrc
