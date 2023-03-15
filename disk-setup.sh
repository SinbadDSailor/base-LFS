
LFS_DISK="$1"

sudo wipefs -a -f "$LFS_DISK"

sudo fdisk "$LFS_DISK" << EOF
o
n
p


+256M
n
p


+2G
t

82
n
p



a
1
w
EOF

sudo mkfs -v -t ext2 -F "${LFS_DISK}1"
sudo mkfs -v -t ext4 -F "${LFS_DISK}3"

sudo mkswap "${LFS_DISK}2"
sudo /sbin/swapon -v "${LFS_DISK}2"
