

CC=gcc ./configure --prefix=/usr -G -O3 -r

echo "MAKE BC"
make

echo "MAKE TEST BC"
make test

echo "MAKE INSTALL BC"
make install

