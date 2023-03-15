

./configure --prefix=/usr           \
            --with-tcl=/usr/lib     \
            --enable-shared         \
            --mandir=/usr/share/man \
            --with-tclinclude=/usr/include

echo "MAKE EXPECT"
make

echo "MAKE TEST EXPECT"
make test

echo "MAKE INSTALL EXPECT"
make install

ln -svf expect5.45.4/libexpect5.45.4.so /usr/lib

