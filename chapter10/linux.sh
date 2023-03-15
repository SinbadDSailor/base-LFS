

make mrproper

make defconfig

echo "MAKE LINUX KERNEL"
make -j4

echo "MAKE MODULES INSTALL"
make modules_install

cp -iv arch/x86/boot/bzImage /boot/vmlinuz-6.1.11-lfs-11.3

cp -iv System.map /boot/System.map-6.1.11

cp -iv .config /boot/config-6.1.11

install -d /usr/share/doc/linux-6.1.11

cp -r Documentation/* /usr/share/doc/linux-6.1.11

