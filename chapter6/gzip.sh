
./configure --prefix=/usr --host=$LFS_TGT

echo "MAKE GZIP"
make

echo "MAKE INSTALL GZIP"
make DESTDIR=$LFS install
