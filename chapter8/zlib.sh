

./configure --prefix=/usr

echo "MAKE ZLIB"
make

echo "MAKE CHECK ZLIB"
make check

echo "MAKE INSTALL ZLIB"
make install

rm -fv /usr/lib/libz.a

