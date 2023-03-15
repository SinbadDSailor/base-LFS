#!/bin/bash


LFS="$1"
shift

if [ "$LFS" == "" ]; then
    exit 1
fi

chmod ugo+x pre-chroot.sh
sudo ./pre-chroot.sh "$LFS"


sudo chroot "$LFS" /usr/bin/env -i   \
    HOME=/root                  \
    TERM="$TERM"                \
    PS1='(lfs chroot) \u:\w\$ ' \
    PATH="/bin:/usr/bin:/sbin:/usr/sbin"     \
    TESTERUID=$UID              \
    LFS=""                      \
    /bin/bash --login +h $@


chmod ugo+x quit-chroot.sh
sudo ./quit-chroot.sh "$LFS" "$USER" "$(id -gn)"
