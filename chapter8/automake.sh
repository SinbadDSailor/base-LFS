

./configure --prefix=/usr --docdir=/usr/share/doc/automake-1.16.5

echo "MAKE AUTOMAKE"
make

echo "MAKE CHECK AUTOCONF"
make -j4 check

echo "MAKE INSTALL AUTOCONF"
make install

