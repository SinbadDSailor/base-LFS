

./configure --prefix=/usr    \
            --disable-static \
            --docdir=/usr/share/doc/gettext-0.21.1

echo "MAKE GETTEXT"
make

echo "MAKE CHECK GETTEXT"
make check

echo "MAKE INSTALL GETTEXT"
make install
chmod -v 0755 /usr/lib/preloadable_libintl.so

