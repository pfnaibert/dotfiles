ARTIX LINUX INSTALLATION AND DOTFILES
==============

## Description
This repository contains my config files for artixlinux.
Moreover, this `README` serves the purpose of a guide to new installation.

Get these dotfiles:
```bash
cd ~/
git clone https://github.com/pfnaibert/dotfiles.git
```

# PRE-INSTALL
Needs sudo
```bash
ls /sys/firmware/efi/efivars
```

## ISO for pendrive
Using `dd`, the "DISK DESTROYER", before running the command line, CHECK if disk (`sdX`) is **actually** the disk you desire using `lsblk`.
DID YOU CHECK?
OK, the command is:

```bash
dd if=~/ISOFolder/iso-filename.iso of=/dev/sdX status="progress"
```

# INSTALL
[artixlinux Installation page](https://wiki.artixlinux.org/Main/Installation)

## Partitioning
```bash
cfdisk /dev/sdX
```

# AFTER INSTALL
```bash
neofetch

sudo pacman -Syu
```

If the following error appears:
```bash
error: failed to commit transaction (conflicting files)
nss: /usr/lib/p11-kit-trust.so existis in filesystem
```

Then use the next line to fix:
```bash
sudo pacman -Syu --overwrite /usr/lib\*/p11-kit-trust.so
```

## Time Fix
```bash
sudo ntpd -qg
sudo hwclock -w

ntpdate pool.ntp.org
```

# Install Programs
Using `pacman`
- `pacman -Syu` to update and upgrade.
- `pacman -Ss programname` to search for a program.
- `pacman -S programname` to install a program

## git, vim, clone dotfiles, and use `bash` scripts
```bash
sudo pacman -S git vim

cd ~/
git clone https://github.com/pfnaibert/dotfiles.git

source ~/dotfiles/scritps/new_install_ryzen
```
## Install Other Programs

Basics
```bash
sudo pacman -S base-devel htop dmenu ranger gnome-terminal feh chromium gnome-disk-utility shellcheck screenkey
```

SOUND
```bash
sudo pacman -S pulseaudio pavucontrol pamixer pulseaudio-alsa
```

i3wm
```bash
sudo pacman -S i3-wm i3blocks i3status
```

Work
```bash
sudo pacman -S r octave perl emacs pandoc pandoc-citeproc
```

TeXlive takes too long, so I put it separately along with evince.
```bash
sudo pacman -S texlive-most evince
```

MISC
```bash
sudo pacman -S youtube-dl
```

NVIDIA Graphics
```bash
sudo pacman -S  nvidia-lts
```

# YAY
Remember that we need `git` and `base-devel` to do the next commands:

```bash
cd ~/
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
```

# VIM

Install vim-plug
```bash
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

Install vim-pathogen
```bash
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
```

## VIMRCS
- [VIM NO-PLUGIN](https://www.youtube.com/watch?v=XA2WjJbmmoM)
- [luke-smith](https://www.youtube.com/watch?v=cTBgtN-s2Zw)
- [primeagen](https://www.youtube.com/watch?v=n9k9scbTuvQ)

## PlugIns
- [vim-plug](https://github.com/junegunn/vim-plug)
- [vim-pathogen](https://github.com/tpope/vim-pathogen)
- [goyo.vim](https://github.com/junegunn/goyo.vim)
- [vim-airline](https://github.com/vim-airline/vim-airline)
- [vim-fugitive](https://github.com/tpope/vim-fugitive)
- [gruvbox (colorscheme)](https://github.com/morhetz/gruvbox)
- [srcery-vim (colorscheme)](https://github.com/srcery-colors/srcery-vim)
- [vimtex](https://github.com/lervag/vimtex)
- [vim-latex (NOT USED)](https://github.com/vim-latex/vim-latex)
- [vim-latex-live-preview (NOT USED)](https://github.com/xuhdev/vim-latex-live-preview)

# GIT CONFIG

```bash
git config pull.rebase false

git status

git pull

git diff filename
```

# i3 configuration

REFS:
- [i3-rice-1/3](https://www.youtube.com/watch?v=j1I63wGcvU4)
- [i3-rice-2/3](https://www.youtube.com/watch?v=8-S0cWnLBKg)
- [i3-rice-3/3](https://www.youtube.com/watch?v=ARKIwOlazKI)

Check `xrandr` to see the video output and choose one option.

# FONTS and ICONS
Using `System San Francisco 11`.
Check `gtkrc` files and change the fonts there.
If you are lucky, `lxappearance` might read the `System San Francisco` fonts out of the box.

- [Link to System San Francisco Fonts in git](https://github.com/supermarin/YosemiteSanFranciscoFont).
- [Link to Download System San Francisco Fonts](https://github.com/supermarin/YosemiteSanFranciscoFont/archive/master.zip).

Artix Linux has a problem os not recognizing fonts, so I just downloaded a bunch of them.
The
[arch linux wiki on fonts](https://wiki.archlinux.org/index.php/Fonts)
is very helpful.

Below are some fonts I downloaded, I do NOT know what package actually fixed my issue.
I still have to examine this.
```bash
sudo pacman -S gnu-free-fonts ttf-dejavu noto-fonts ttf-font-awesome otf-font-awesome icu unicode-emoji
```

- [Font-Awesome](https://github.com/FortAwesome/Font-Awesome)
- [Font-Awesome releases](https://github.com/FortAwesome/Font-Awesome/releases)

# Mount Disks

```bash
lsblk -f

mount /dev/sdX mnt/mountpoint
```

FSTAB
```bash
cat /etc/fstab

sudo cp /etc/fstab /etc/fstab.old
```

edit `/etc/fstab`
```bash
sudo vim /etc/fstab
```

with the following line (whithout the comment):
```bash
# <file system> <mount point>   <type>  <options>       <dump>  <pass>
/dev/sdX /mountpoint ext4 defaults 0 0
UUID=XXXXX /mountpoint ext4 defaults 0 0
```

# google-chrome

```bash
cd ~/
yay -S google-chrome
```

# TORRENTS
```bash
sudo pacman -S qbittorrent
```

# SPOTIFY

You will need
```bash
sudo pacman -S playerctl
```

There are problems with the gpg keys, so check the
[AUR spotify page](https://aur.archlinux.org/packages/spotify/)
and
[spotify linux page](https://www.spotify.com/br/download/linux/)

When you resolve the key problems, run.

```bash
yay -S spotify
```

# DROPBOX

# DISCORD

# SKYPE

# RSTUDIO

