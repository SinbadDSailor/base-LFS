

./configure --prefix=/usr \
            --docdir=/usr/share/doc/bison-3.8.2

echo "MAKE BISON"
make
sleep 3

echo "MAKE INSTALL BISON"
make install
sleep 3
