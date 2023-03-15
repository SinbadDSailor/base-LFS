
./configure --prefix=/usr                   \
            --localstatedir=/var/lib/locate \
            --host=$LFS_TGT                 \
            --build=$(build-aux/config.guess)

echo "MAKE FINDUTILS"
make

echo "MAKE INSTALL FINDUTILS"
make DESTDIR=$LFS install
