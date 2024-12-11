#!/bin/bash

sudo nmcli --ask dev wifi connect RT-GPON-431C

mkdir -p soft/wineprefix

read -p 'Next install xorg' var1
sudo pacman -Syu
sudo pacman -S xorg-server xorg-xinit xorg-apps

read -p 'Next install nouveau' var1
sudo pacman -S xf86-video-nouveau  mesa

read -p 'Next install wine' var1
sudo pacman -S wine winetricks

#read -p 'Next install lightdm' var1
#pacman -S lightdm lightdm-gtk-greeter

#read -p 'Next install nvidia-lts' var1
#pacman -S nvidia-lts

#read -p 'Next install nvidia' var1
#pacman -S nvidia nvidia-utils

