

./configure --prefix=/usr    \
            --disable-static \
            --docdir=/usr/share/doc/xz-5.4.1

echo "MAKE XZ-UTILS"
make

echo "MAKE CHECK XZ-UTILS"
make check

echo "MAKE INSTALL XZ-UTILS"
make install

