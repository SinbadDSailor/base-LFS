

sed -i /ARPD/d Makefile
rm -fv man/man8/arpd.8

echo "MAKE IPROUTE2"
make NETNS_RUN_DIR=/run/netns

echo "MAKE INSTALL IPROUTE2"
make SBINDIR=/usr/sbin install

mkdir -pv /usr/share/doc/iproute2-6.1.0
cp -v COPYING README* /usr/share/doc/iproute2-6.1.0

