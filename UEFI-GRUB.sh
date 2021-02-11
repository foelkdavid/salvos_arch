#!/bin/bash
echo "setting up grub for UEFI system:" &&
pacman -S efibootmgr
read -p "Please enter path for efi mountpoint: " EFIMP &&
grub-install --target=i386-pc --efi-directory=$EFIMP --bootloader-id=GRUB &&
grub-mkconfig -o /boot/grub/grub.cfg &&
echo "done"
