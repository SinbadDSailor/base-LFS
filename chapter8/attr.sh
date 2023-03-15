

./configure --prefix=/usr     \
            --disable-static  \
            --sysconfdir=/etc \
            --docdir=/usr/share/doc/attr-2.5.1

echo "MAKE ATTR"
make

echo "MAKE CHECK ATTR"
make check

echo "MAKE INSTALL ATTR"
make install

