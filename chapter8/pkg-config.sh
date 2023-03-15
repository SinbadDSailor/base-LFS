

./configure --prefix=/usr              \
            --with-internal-glib       \
            --disable-host-tool        \
            --docdir=/usr/share/doc/pkg-config-0.29.2

echo "MAKE PKG-CONFIG"
make

echo "MAKE CHECK PKG-CONFIG"
make check

echo "MAKE INSTALL PKG-CONFIG"
make install

