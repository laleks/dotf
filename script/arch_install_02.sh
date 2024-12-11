#!/bin/bash

read -p 'Next set-ntp' var1
timedatectl set-ntp true

read -p 'Next set timezone' var1
ln -sf /usr/share/zoneinfo/Asia/Yekaterinburg /etc/localtime
hwclock --systohc

read -p 'Next edit /etc/locale.gen' var1
echo 'en_US.UTF-8 UTF-8' >> /etc/locale.gen
echo 'ru_RU.UTF-8 UTF-8' >> /etc/locale.gen

locale-gen

read -p 'Next edit /etc/locale.conf' var1
echo 'LANG=en_US.UTF-8' > /etc/locale.conf

read -p 'Next add compname to /etc/hostname' var1
echo 'barbos' > /etc/hostname

read -p 'Next add localhost to /etc/hosts' var1
cat > /etc/hosts << EOF
127.0.0.1 localhost
::1       localhost
127.0.1.1 barbos.localdomain barbos
EOF

read -p 'Next install neovim and unmark multilib' var1
pacman -S neovim sxel
nvim /etc/pacman.conf


read -p 'Next install some packages' var1
pacman -S networkmanager ntfs-3g refind gdisk git base-devel polkit pipewire pipewire-pulse pipewire-alsa helvum pavucontrol
pacman -S atool picom sxiv htop bpytop screenfetch ueberzug man lynx mediainfo ffmpegthumbnailer odt2txt bat firefox
pacman -S rsync zathura poppler catdoc python-pip p7zip
pacman -S sudo zsh i3-gaps i3blocks i3lock i3status rofi nitrogen

read -p 'Next change root pass' var1
passwd

read -p 'Next add user lt' var1
useradd -m -g users -G wheel -s /bin/zsh lt

read -p 'Next change pass lt' var1
passwd lt


read -p 'Next enable NetworkManager' var1
systemctl enable NetworkManager

read -p 'Next run refind' var1
refind-install

#read -p 'Next add some value to refind.conf' var1
#cat >> /boot/efi/EFI/refind/refind.conf << EOF
#resolution 3840 2160
#use_graphics_for linux
#EOF

#read -p 'Next manual edit refind.conf' var1
#nvim /boot/efi/EFI/refind/refind.conf

#read -p 'Next install dwm' var1
#cd /home/lt/soft/dwm
#make clean install

read -p 'Next install st' var1
cd /home/lt/soft/st-0.8.5
make clean install

read -p 'Next install lf' var
cd /home
git clone https://aur.archlinux.org/lf.git
cd lf
makepkg -si

read -p 'Next set /etc/sudoers' var1
echo 'lt ALL=(ALL) ALL' >> /etc/sudoers

read -p 'Next manual edit /boot/refind-linux.conf for load menu' var1
nvim /boot/refind_linux.conf

read -p 'Next manual make dir sda1 sdb1 sdc1' var1
mkdir /mnt/sda1 /mnt/sdb1 /mnt/sdc1

echo 'Finished. Need exit chroot, umount -R /mnt and reboot'
