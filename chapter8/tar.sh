

FORCE_UNSAFE_CONFIGURE=1  \
./configure --prefix=/usr

echo "MAKE TAR"
make

echo "MAKE CHECK TAR"
make check

echo "MAKE INSTALL TAR"
make install
make -C doc install-html docdir=/usr/share/doc/tar-1.34

