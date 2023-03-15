

./config --prefix=/usr         \
         --openssldir=/etc/ssl \
         --libdir=lib          \
         shared                \
         zlib-dynamic

echo "MAKE OPENSSL"
make

echo "MAKE TEST OPENSSL"
make test

echo "MAKE INSTALL OPENSSL"
sed -i '/INSTALL_LIBS/s/libcrypto.a libssl.a//' Makefile
make MANSUFFIX=ssl install

mv -v /usr/share/doc/openssl /usr/share/doc/openssl-3.0.8

cp -vfr doc/* /usr/share/doc/openssl-3.0.8

