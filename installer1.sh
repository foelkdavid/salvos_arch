#!/bin/bash

echo "initializing archkeys" &&
pacman-key --init &&
pacman-key --populate archlinux &&

echo "running pacstrap: loading packages to new system:" &&
pacstrap /mnt arch-install-scripts base archlinux-keyring linux linux-firmware syslinux sudo iwd nano dhcpcd grub git man binutils make gcc pkg-config fakeroot patch neovim neofetch memtest86+ edk2-shell &&
echo "done." &&

echo "generating fstab file:" &&
genfstab -U /mnt >> /mnt/etc/fstab &&
echo "done." &&

echo "copying arch-installer to new system:" &&
cp -r /root/salvos_arch /mnt/root/ &&
echo "done!" &&

echo "system is ready for further configuration." &&
echo "run (arch-chroot /mnt) to proceed."

