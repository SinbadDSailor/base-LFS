
./configure --prefix=/usr                     \
            --host=$LFS_TGT                   \
            --build=$(build-aux/config.guess) \
            --disable-static                  \
            --docdir=/usr/share/doc/xz-5.4.1

echo "MAKE XZ"
make

echo "MAKE INSTALL XZ"
make DESTDIR=$LFS install

rm -v $LFS/usr/lib/liblzma.la
