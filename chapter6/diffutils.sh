
./configure --prefix=/usr --host=$LFS_TGT

echo "MAKE DIFFUTILS"
make

echo "MAKE INSTALL DIFFUTILS"
make DESTDIR=$LFS install
