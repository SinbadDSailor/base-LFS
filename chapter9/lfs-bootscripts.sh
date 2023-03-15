

echo "MAKE INSTALL LFS BOOTSCRIPTS"
make install

echo "CUSTOM UDEV RULES"
bash /usr/lib/udev/init-net-rules.sh

cat /etc/udev/rules.d/70-persistent-net.rules

