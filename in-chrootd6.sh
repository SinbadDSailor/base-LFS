

cd /sources

cat > /etc/fstab << "EOF"
# Begin /etc/fstab

# file system  mount-point  type     options             dump  fsck
#                                                              order

/dev/sdb3      /             ext4   defaults            1     1
/dev/sdb2     swap         swap     pri=1               0     0
/dev/sdb1     /boot         ext2     defaults               1     1

# End /etc/fstab
EOF

source packageinstall.sh 10 linux

install -v -m755 -d /etc/modprobe.d
cat > /etc/modprobe.d/usb.conf << "EOF"
# Begin /etc/modprobe.d/usb.conf

install ohci_hcd /sbin/modprobe ehci_hcd ; /sbin/modprobe -i ohci_hcd ; true
install uhci_hcd /sbin/modprobe ehci_hcd ; /sbin/modprobe -i uhci_hcd ; true

# End /etc/modprobe.d/usb.conf
EOF


grub-install --target i386-pc /dev/sdb

cat > /boot/grub/grub.cfg << "EOF"
# Begin /boot/grub/grub.cfg
set default=0
set timeout=5

insmod ext2
set root=(hd0,1)

menuentry "GNU/Linux, Linux 6.1.11-lfs-11.3-systemd" {
        linux   /vmlinuz-6.1.11-lfs-11.3-systemd root=/dev/sdb3 rw
}
EOF



