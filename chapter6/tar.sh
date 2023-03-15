
./configure --prefix=/usr                     \
            --host=$LFS_TGT                   \
            --build=$(build-aux/config.guess)

echo "MAKE TAR"
make

echo "MAKE INSTALL TAR"
make DESTDIR=$LFS install
