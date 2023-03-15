

./configure --prefix=/usr   \
            --enable-shared \
            --without-ensurepip

echo "MAKE PYTHON"
make
sleep 3

echo "MAKE INSTALL PYTHON"
make install
sleep 3
