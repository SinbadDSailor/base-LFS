
./configure --prefix=/usr   \
            --host=$LFS_TGT \
            --build=$(build-aux/config.guess)


echo "MAKE M4"
make

echo "MAKE INSTALL M4"
make DESTDIR=$LFS install
