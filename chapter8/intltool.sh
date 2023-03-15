

sed -i 's:\\\${:\\\$\\{:' intltool-update.in

./configure --prefix=/usr

echo "MAKE INTLTOOL"
make

echo "MAKE CHECK INTLTOOL"
make check

echo "MAKE INSTALL INTLTOOL"
make install
install -v -Dm644 doc/I18N-HOWTO /usr/share/doc/intltool-0.51.0/I18N-HOWTO

