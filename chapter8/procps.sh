

./configure --prefix=/usr                           \
            --docdir=/usr/share/doc/procps-ng-4.0.2 \
            --disable-static                        \
            --disable-kill

echo "MAKE PROCPS"
make

echo "MAKE CHECK PROCPS"
make check

echo "MAKE INSTALL PROCPS"
make install

