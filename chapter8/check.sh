

./configure --prefix=/usr --disable-static

echo "MAKE CHECK"
make

echo "MAKE CHECK CHECK"
make check

echo "MAKE INSTALL CHECK"
make docdir=/usr/share/doc/check-0.15.2 install

