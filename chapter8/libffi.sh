

./configure --prefix=/usr          \
            --disable-static       \
            --with-gcc-arch=native

echo "MAKE LIBFFI"
make

echo "MAKE CHECK LIBFFI"
make check

echo "MAKE INSTALL LIBFFI"
make install

