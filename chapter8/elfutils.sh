

./configure --prefix=/usr                \
            --disable-debuginfod         \
            --enable-libdebuginfod=dummy

echo "MAKE LIBELF"
make

echo "MAKE CHECK LIBELF"
make check

echo "MAKE INSTALL LIBELF"
make -C libelf install
install -vm644 config/libelf.pc /usr/lib/pkgconfig
rm /usr/lib/libelf.a

