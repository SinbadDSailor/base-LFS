

./configure --prefix=/usr    \
            --disable-static \
            --docdir=/usr/share/doc/expat-2.5.0

echo "MAKE EXPAT"
make

echo "MAKE CHECK EXPAT"
make check

echo "MAKE INSTALL EXPAT"
make install

install -v -m644 doc/*.{html,css} /usr/share/doc/expat-2.5.0

