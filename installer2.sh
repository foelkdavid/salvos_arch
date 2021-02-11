#!/bin/bash

echo "setting timezone:" &&
ln -sf /usr/share/zoneinfo/Europe/Vienna /etc/localtime &&
echo "done." &&

echo "syncing system time:" &&
hwclock --systohc &&
echo "done." &&

echo "appending locales to locale.gen:" &&
echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen &&
echo "generating locales:" &&
locale-gen &&
echo "setting system locale:" &&
echo "LANG=en_US.UTF-8" >> /etc/locale.conf &&
echo "done!" &&

echo "setting keymap" &&
echo "KEYMAP=de-latin1" >> /etc/vconsole.conf &&
echo "done" &&

echo "setting hostname:" &&
read -p "Please enter a valid Hostname : " CHN &&
echo $CHN >> /etc/hostname &&
echo "127.0.0.1 localhost" >> /etc/hosts &&
echo "::1" >> /etc/hosts &&
echo "127.0.1.1 $CHN.localdomain $CHN" >> /etc/hosts &&
echo "done!" &&

echo "installing microcode" &&

read -p "Please enter your CPU manufacturer:  [ amd | intel ]" SYSBRND && 
pacman -S $SYSBRND-ucode &&
echo "done!" &&

echo "enabling dhcpcd"
systemctl enable dhcpcd &&

echo "creating new User" &&
read -p "Please enter a vailid username: " USRNME &&
useradd -m $USRNME &&
passwd $USRNME &&
usermod -a -G wheel $USRNME &&

echo "setting up sudo" &&
echo "%wheel ALL=(ALL) ALL" >> /etc/sudoers &&
echo "%wheel ALL=(ALL) NOPASSWD: /sbin/poweroff, /sbin/reboot, /sbin/shutdown" >> /etc/sudoers &&
echo "done." &&

echo "locking root user" &&
passwd -l root &&
echo "done" &&

echo "everything is installed, you can now reboot the system"
