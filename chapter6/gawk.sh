
sed -i 's/extras//' Makefile.in

./configure --prefix=/usr   \
            --host=$LFS_TGT \
            --build=$(build-aux/config.guess)

echo "MAKE GAWK"
make

echo "MAKE INSTALL GAWK"
make DESTDIR=$LFS install
