

./configure --prefix=/usr

echo "MAKE PATCH"
make

echo "MAKE CHECK PATCH"
make check

echo "MAKE INSTALL PATCH"
make install

