#!/bin/bash

read -p 'Next set-ntp' var1
timedatectl set-ntp true

#read -p 'Next mkfs boot' var1
#mkfs.fat -F32 /dev/nvme0n1p1

read -p 'Next mkfs root on nvme0n1p4' var1
mkfs.ext4 /dev/nvme0n1p4

read -p 'Next mount nvme0n1p4 to /mnt' var1
mount /dev/nvme0n1p4 /mnt

read -p 'Next mount nvme0n1p1 to /mnt/boot/efi' var1
mount --mkdir /dev/nvme0n1p1 /mnt/boot/efi

read -p 'Next mount nvme0n1p5 to /mnt/home' var1
mount --mkdir /dev/nvme0n1p5 /mnt/home

read -p 'Next pacstrap to /mnt' var1
pacman -Syu
pacstrap /mnt base linux linux-headers linux-firmware intel-ucode
#pacstrap /mnt base linux-lts linux-lts-headers linux-firmware intel-ucode

read -p 'Next genfstab' var1

genfstab -U /mnt >> /mnt/etc/fstab

cp arch_02 to /home

read -p 'Next need copy arch_install_after_chroot in home end start it' var1
