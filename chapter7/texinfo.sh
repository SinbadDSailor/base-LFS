

./configure --prefix=/usr

echo "MAKE TEXINFO"
make
sleep 3

echo "MAKE INSTALL TEXINFO"
make install
sleep 3
