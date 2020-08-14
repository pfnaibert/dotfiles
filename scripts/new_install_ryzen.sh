#!/bin/bash
# new_install_ryzen
####################################
# Supposing you already installed git and cloned the dotfiles in ~/dotfiles:
# sudo pacman -S git
# cd ~/
# git clone https://github.com/pfnaibert/dotfiles.git
####################################

# new_bashrc
if [[ -f ~/.bashrc ]]; then
mv ~/.bashrc ~/.bashrc.old
echo $'#\n# ~/.bashrc\n#\n\nsource ~/dotfiles/bashrc' > ~/.bashrc
else
echo $'#\n# ~/.bashrc\n#\n\nsource ~/dotfiles/bashrc' > ~/.bashrc
fi

# new_vimrc
if [[ -f ~/.vimrc ]]; then
mv ~/.vimrc ~/.vimrc.old
echo $'"\n" ~/.vimrc\n"\n\nsource ~/dotfiles/vimrc' > ~/.vimrc
else
echo $'"\n" ~/.vimrc\n"\n\nsource ~/dotfiles/vimrc' > ~/.vimrc
fi

# refresh bashrc
source ~/.bashrc

# Add basic folders
mkdir ~/DOING ~/DONE ~/Documents/LaTeX

# Secondary HDD and symlinks
mkdir /mnt/barracuda
mkdir /mnt/usb

ln -s /mnt/barracuda ~/barracuda
ln -s /mnt/barracuda/Dropbox ~/Dropbox
ln -s /mnt/barracuda/pdf_db ~/pdf_db
ln -s /mnt/usb/ ~/usb

# Install vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

