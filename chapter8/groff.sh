

PAGE=A4 ./configure --prefix=/usr

echo "MAKE GROFF"
make

echo "MAKE INSTALL GROFF"
make install

