This is a guide on how to use these files.

1.	partition the drives to your liking.	|	eg. fdisk -l /dev/sdX 
2.	create filesystems / swap space. 	|	eg. mkfs.ext4 /dev/sdX? mkswap /dev/sdX?
3.	mount your systems			|	eg. mount /dev/sdX? /mnt
4.	make installer1.sh executable		|	chmod +x installer1.sh
5.	run installer1.sh			|	./pacstrap.sh
6.	chroot into new system			|	arch-chroot /mnt
7.	make installer2.sh executable		|	chmod +x /root/arch-installer/installer2.sh NOTE: MAKE SURE YOU ARE ALREADY CHROOTED INTO THE NEW SYSTEM
8.	run installer2.sh			|	./installer2.sh
