
./configure --prefix=/usr   \
            --host=$LFS_TGT

echo "MAKE GREP"
make

echo "MAKE INSTALL GREP"
make DESTDIR=$LFS install
