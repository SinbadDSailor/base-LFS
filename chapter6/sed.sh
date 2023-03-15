
./configure --prefix=/usr   \
            --host=$LFS_TGT

echo "MAKE SED"
make

echo "MAKE INSTALL SED"
make DESTDIR=$LFS install
