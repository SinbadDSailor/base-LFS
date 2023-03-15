

./configure --prefix=/usr

echo "MAKE M4"
make

echo "MAKE CHECK M4"
make check

echo "MAKE INSTALL M4"
make install

