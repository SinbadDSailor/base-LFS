
mkdir -v build
cd build

../configure --prefix=$LFS/tools \
             --with-sysroot=$LFS \
             --target=$LFS_TGT   \
             --disable-nls       \
             --enable-gprofng=no \
             --disable-werror

echo "MAKE BINUTILS"
make
sleep 5

echo "MAKE INSTALL BINUTILS"
make install
sleep 5
