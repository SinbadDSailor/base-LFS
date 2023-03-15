

./configure --prefix=/usr    \
            --disable-static \
            --enable-libgdbm-compat

echo "MAKE GDBM"
make

echo "MAKE CHECK GDBM"
make check

echo "MAKE INSTALL GDBM"
make install

