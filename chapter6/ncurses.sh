
sed -i s/mawk// configure

echo "MKDIR BUILD"
mkdir build

echo "PUSHD BUILD"
pushd build
  ../configure
  make -C include
  make -C progs tic
popd
echo "POPD BUILD"

./configure --prefix=/usr                \
            --host=$LFS_TGT              \
            --build=$(./config.guess)    \
            --mandir=/usr/share/man      \
            --with-manpage-format=normal \
            --with-shared                \
            --without-normal             \
            --with-cxx-shared            \
            --without-debug              \
            --without-ada                \
            --disable-stripping          \
            --enable-widec

echo "MAKE NCURSES"
make

echo "MAKE INSTALL NCURSES"
make DESTDIR=$LFS TIC_PATH=$(pwd)/build/progs/tic install

echo "INPUT(-lncursesw)" > $LFS/usr/lib/libncurses.so
