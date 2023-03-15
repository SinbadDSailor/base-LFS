

./configure --prefix=/usr        \
            --enable-shared      \
            --with-system-expat  \
            --with-system-ffi    \
            --enable-optimizations

echo "MAKE PYTHON"
make

echo "MAKE INSTALL PYTHON"
make install

install -v -dm755 /usr/share/doc/python-3.11.2/html

tar --strip-components=1  \
    --no-same-owner       \
    --no-same-permissions \
    -C /usr/share/doc/python-3.11.2/html \
    -xvf ../python-3.11.2-docs-html.tar.bz2

