

cp -v configfsf.guess config.guess
cp -v configfsf.sub   config.sub

./configure --prefix=/usr    \
            --enable-cxx     \
            --disable-static \
            --docdir=/usr/share/doc/gmp-6.2.1

echo "MAKE GMP AND DOCUMENTATION"
make
make html

echo "MAKE CHECK GMP"
make check 2>&1 | tee gmp-check-log

awk '/# PASS:/{total+=$3} ; END{print total}' gmp-check-log
sleep 7

echo "MAKE INSTALL GMP"
make install
make install-html

