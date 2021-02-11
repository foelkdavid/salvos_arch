#!/bin/bash
echo "setting up grub for BIOS system:" &&
read -p "Please enter path for filesystem: " FSPI &&
grub-install --target=i386-pc $FSPI &&
grub-mkconfig -o /boot/grub/grub.cfg &&
echo "done"
