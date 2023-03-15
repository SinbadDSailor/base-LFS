

./configure --prefix=/usr --docdir=/usr/share/doc/bison-3.8.2

echo "MAKE BISON"
make

echo "MAKE CHECK BISON"
make check

echo "MAKE INSTALL BISON"
make install

