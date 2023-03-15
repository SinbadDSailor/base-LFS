

./configure --prefix=/usr

echo "MAKE GZIP"
make

echo "MAKE CHECK GZIP"
make check

echo "MAKE INSTALL GZIP"
make install

