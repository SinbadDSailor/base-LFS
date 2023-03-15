
mkdir build

pushd build
  ../configure --disable-bzlib      \
               --disable-libseccomp \
               --disable-xzlib      \
               --disable-zlib
  make
popd

./configure --prefix=/usr --host=$LFS_TGT --build=$(./config.guess)

echo "MAKE FILE"
make FILE_COMPILE=$(pwd)/build/src/file

echo "MAKE INSTALL FILE"
make DESTDIR=$LFS install

rm -v $LFS/usr/lib/libmagic.la
