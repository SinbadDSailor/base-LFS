
./configure --prefix=/usr   \
            --host=$LFS_TGT \
            --build=$(build-aux/config.guess)

echo "MAKE PATCH"
make

echo "MAKE INSTALL PATCH"
make DESTDIR=$LFS install
