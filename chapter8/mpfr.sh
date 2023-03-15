

sed -e 's/+01,234,567/+1,234,567 /' \
    -e 's/13.10Pd/13Pd/'            \
    -i tests/tsprintf.c

./configure --prefix=/usr        \
            --disable-static     \
            --enable-thread-safe \
            --docdir=/usr/share/doc/mpfr-4.2.0

echo "MAKE MPFR"
make
make html

echo "MAKE CHECK MPFR"
make check

echo "MAKE INSTALL MPFR"
make install
make install-html

