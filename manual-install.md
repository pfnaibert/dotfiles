---
title: ARTIXLINUX BASE MANUAL INSTALLATION
author: Paulo Ferreira Naibert
---

# DESCRIPTION

This document contains a guide to new **MANUAL** installation of `artixlinux-base-runit`.
This document is in no way an original idea, I draw heavily from
[luke smith's video](https://www.youtube.com/watch?v=nCc_4fSYzRA&t)
to a manual installation of `artixlinux-base-runit`.
Also, you are advised to check the
[artixlinux Installation page](https://wiki.artixlinux.org/Main/Installation).

# PRE-INSTALL

## ISO for pendrive
Using `dd`, the "DISK DESTROYER", before running the command line, CHECK if disk (`sdX`) is **actually** the disk you desire using `lsblk`.
DID YOU CHECK?
OK, the command is:

```bash
dd if=~/ISOFolder/iso-filename.iso of=/dev/sdX status="progress"
```

# INSTALL


## ARTIX LOGIN

```bash
username: root
password: artix
```

or

```bash
username: artix
password: artix
```

And use

```bash
sudo su
```

## NEOFETCH
```bash
neofetch
```

## UEFI v. LEGACY BOOT

```bash
ls /sys/firmware/efi/efivars
```
If you are using **`legacy boot`**, there will be an error message of the "no such file or directory" sort.

## Partitioning
Make sure you have an internet connection with

```bash
ping google.com
```
or another site you prefer.

## Partitioning
First, check the disks attached with

```bash
lsblk
```

Then, we use `fdisk` to partition the chosen disk:

```bash
fdisk /dev/sdX
```
In `fdisk` we use the following commands:

- m to get help.
- d to delete a partition.
- p to list partitions.
- n to make a new partition.
- w to write the partitions.

We will use three partitions:

- boot with size 1G: +1G
- root with size 30G: +30G
- home with the rest of the disk for size: no size specification needed (leave blank).

Let's run `lsblk` to check how is the drive looking:
```bash
lsblk
```

## FILESYSTEMS
Once we partitioned our drive, we'll need to put filesystems on our partitions.

```bash
mkfs.ext4 /dev/sdX3
mkfs.ext4 /dev/sdX2
mkfs.fat -F32 /dev/sdX1
```

And, once again, we run `lsblk` to check the drive:

```bash
lsblk
```

## MOUNTING DRIVES

```bash
mount /dev/sdX2 /mnt
```

```bash
mkdir /mnt/home
mkdir /mnt/boot
```

```bash
mount /dev/sdX1 /mnt/boot
mount /dev/sdX3 /mnt/home
```

```bash
lsblk
```

## THE REAL INSTALL

Change mirrors.
```bash
vim /etc/pacman.d/mirrorlist
```

The "real installation" is now using `basestrap`.
The real basic installation is something like:

```bash
basestrap /mnt base base-devel runit elogind-runit
```

But I want more programs, so I will use:

```bash
basestrap /mnt base base-devel runit elogind-runit linux linux-firmware vim htop git ranger gnome-terminal chromium
```

## MOUNTING

```bash
fstabgen -U /mnt >> /mnt/etc/fstab
```

## TIMEZONE

```bash
ln -sf /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime
```

```bash
hwclock --systohc
```

## LOCALE

```bash
vim /etc/locale.gen
```
Uncomment desired locales and run

```bash
local-gen
```

```bash
vim /etc/locale.conf
```

and write

```bash
LANG=en_US.UTF-8
```

## FURTHER PACKAGES

```bash
pacman -S networkmanager networkmanager-runit
```

```bash
ln -s /etc/runit/sv/NetworkManager /etc/runit/runsvdir/current
```

```bash
vim /etc/hostname
```

```bash
HOSTNAME
```
substitute HOSTNAME with the name your computer.

```bash
vim /etc/hosts
```

```bash
127.0.0.1	localhost
::1	localhost
127.0.0.1	HOSTNAME.localdomain HOSTNAME
```
substitute HOSTNAME with the name your computer.

## GRUB

### Legacy BOOT

```bash
pacman -S grub
```

```bash
grub-install --target=i386-pc /dev/sdX
```

### UEFI

```bash
pacman -S grub efibootmgr
```

```bash
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
```

```bash
grub-mkconfig -o /boot/grub/grub.cfg
```

## SET PASSWORD

```bash
passwd
```

# GRAPHICAL ENVIRONMENT

# AFTER INSTALL

```bash
neofetch
```

```bash
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
And we use `sudo pacman -Syu` again.

## Time Fix

```bash
sudo ntpd -qg
sudo hwclock -w
```

```bash
ntpdate pool.ntp.org
```

## Basic FOLDERS

```bash
mkdir ~/DOING ~/DONE
mkdir -pv ~/Documents/LaTeX
mkdir -pv ~/.scripts
```

## Install Programs

Basics

```bash
sudo pacman -S git base-devel vim htop dmenu ranger gnome-terminal feh chromium
```

```bash
cd ~/
git clone https://github.com/pfnaibert/dotfiles.git
cp -i ~/dotfiles/.vimrc ~/.vimrc
cp -i ~/dotfiles/.bashrc ~/.bashrc
source ~/.bashrc
```

Correct error in vim because of the PATHOGEN package
```bash
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
```
