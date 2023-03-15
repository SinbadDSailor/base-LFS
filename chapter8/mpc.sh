

./configure --prefix=/usr    \
            --disable-static \
            --docdir=/usr/share/doc/mpc-1.3.1

echo "MAKE MPC"
make
make html

echo "MAKE CHECK MPC"
make check

echo "MAKE INSTALL MPC"
make install
make install-html

