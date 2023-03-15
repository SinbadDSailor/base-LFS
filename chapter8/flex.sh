

./configure --prefix=/usr \
            --docdir=/usr/share/doc/flex-2.6.4 \
            --disable-static

echo "MAKE FLEX"
make

echo "MAKE CHECK FLEX"
make check

echo "MAKE INSTALL CHECK"
make install

ln -sv flex /usr/bin/lex

