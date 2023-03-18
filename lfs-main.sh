#!/bin/bash

export LFS=/mnt/lfs
export LFS_TGT=x86_64-lfs-linux-gnu
export LFS_DISK=/dev/sdb
export MAKEFLAGS='-j4'
export SYSTEMFLAG="SD"


if ! grep -q "$LFS" /proc/mounts; then
    source disk-setup.sh "$LFS_DISK"
    sudo mkdir -pv $LFS
    sudo mount "${LFS_DISK}3" "$LFS"
    sudo chown -v $USER "$LFS"
fi

#CREATE DIRECTORIES
mkdir -pv $LFS/sources
mkdir -pv $LFS/tools

mkdir -pv $LFS/boot
mkdir -pv $LFS/{etc,var} $LFS/usr/{bin,lib,sbin}

for i in bin lib sbin; do
  ln -sv usr/$i $LFS/$i
done

case $(uname -m) in
    x86_64) mkdir -pv $LFS/lib64;;
esac

sudo mount "${LFS_DISK}1" "$LFS/boot"

#DO NOT COMMENT THIS SECTION
cp -rf *.sh chapter* packages.csv "$LFS/sources"
cd "$LFS/sources"
export PATH="$LFS/tools/bin:$PATH"
#DO NOT COMMENT THIS SECTION


#DOWNLOAD PACKAGES
source download.sh

# CHAPTER 5
for package in binutils gcc linux glibc libstdc; do
    source packageinstall.sh 5 $package
done

# CHAPTER 6
for package in m4 ncurses bash coreutils diffutils file findutils gawk grep gzip make patch sed tar xz-utils binutils gcc; do
    source packageinstall.sh 6 $package
done

chmod ugo+x pre-chroot.sh
chmod ugo+x chroot-bash.sh
chmod ugo+x packageinstall.sh
chmod ugo+x in-chrootv.sh
chmod ugo+x in-chroot2.sh
chmod ugo+x in-chroot3.sh
chmod ugo+x in-chrootv4.sh
chmod ugo+x in-chrootv5.sh
chmod ugo+x in-chrootv6.sh
chmod ugo+x in-chrootd.sh
chmod ugo+x in-chrootd4.sh
chmod ugo+x in-chrootd5.sh
chmod ugo+x in-chrootd6.sh
chmod ugo+x quit-chroot.sh


# CHAPTER 7, 8, 9 & 10


if [ "$SYSTEMFLAG" = "SV" ]; then

    sudo ./pre-chroot.sh "$LFS"

    for script in "/sources/in-chrootv.sh" "/sources/in-chroot2.sh" "/sources/in-chroot3.sh" "/sources/in-chrootv4.sh" \
                  "/sources/in-chrootv5.sh" "/sources/in-chrootv6.sh"; do
        echo "ENTERING $script IN CHROOT ENVIRONMENT"
        sleep 3
        sudo chroot "$LFS" /usr/bin/env -i   \
                HOME=/root                  \
                TERM="$TERM"                \
                PS1='(lfs chroot) \u:\w\$ ' \
                PATH="/bin:/usr/bin:/sbin:/usr/sbin"     \
                TESTERUID=$UID              \
                MAKEFLAGS='-j4'             \
                SYSTEMFLAG="$SYSTEMFLAG"    \
                /bin/bash --login +h -c "$script"

    done

    sudo ./quit-chroot.sh "$LFS" "$USER" "$(id -gn)"

elif [ "$SYSTEMFLAG" = "SD" ]; then

    sudo ./pre-chroot.sh "$LFS"

    for script in "/sources/in-chrootd.sh" "/sources/in-chroot2.sh" "/sources/in-chroot3.sh" "/sources/in-chrootd4.sh" \
                  "/sources/in-chrootd5.sh" "/sources/in-chrootd6.sh"; do
        echo "ENTERING $script IN CHROOT ENVIRONMENT"
        sleep 3
        sudo chroot "$LFS" /usr/bin/env -i   \
                HOME=/root                  \
                TERM="$TERM"                \
                PS1='(lfs chroot) \u:\w\$ ' \
                PATH="/bin:/usr/bin:/sbin:/usr/sbin"     \
                TESTERUID=$UID              \
                MAKEFLAGS='-j4'             \
                SYSTEMFLAG="$SYSTEMFLAG"    \
                /bin/bash --login +h -c "$script"

    done

    sudo ./quit-chroot.sh "$LFS" "$USER" "$(id -gn)"

else

    echo "Invalid entry!"
    echo "Populate the SYSTEMFLAG variable again."

fi

# CHAPTER 7, 8, 9 & 10







