

make mrproper

make defconfig

echo "MAKE LINUX KERNEL"
make -j4

echo "MAKE MODULES INSTALL"
make modules_install

if [ "$SYSTEMFLAG" = "SV" ]; then

    cp -iv arch/x86/boot/bzImage /boot/vmlinuz-6.1.11-lfs-11.3
    cp -iv System.map /boot/System.map-6.1.11
    cp -iv .config /boot/config-6.1.11

elif [ "$SYSTEMFLAG" = "SD" ]; then

    cp -iv arch/x86/boot/bzImage /boot/vmlinuz-6.1.11-lfs-11.3-systemd
    cp -iv System.map /boot/System.map-6.1.11
    cp -iv .config /boot/config-6.1.11

fi


install -d /usr/share/doc/linux-6.1.11
cp -r Documentation/* /usr/share/doc/linux-6.1.11

