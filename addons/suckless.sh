#!/bin/bash
mkdir ~/.suckless &&

###fetching dependencies
sudo pacman -S base-devel xorg-server xorg-xinit libx11 libxinerama libxft webkit2gtk &&

###cloning packages
git clone https://git.suckless.org/dwm ~/.suckless/dwm &&
git clone https://git.suckless.org/st ~/.suckless/st &&
#git clone https://git.suckless.org/slock ~/.suckless/slock &&

###creating .xinitrc
echo "exec dwm" >> ~/.xinitrc &&

###building packages
cd ~/.suckless/st && sudo make clean install &&
cd ~/.suckless/dwm && sudo make clean install &&

###editing .bash_profile
echo "startx" >> ~/.bash_profile
