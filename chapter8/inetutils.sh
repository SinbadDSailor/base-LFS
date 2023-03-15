

./configure --prefix=/usr        \
            --bindir=/usr/bin    \
            --localstatedir=/var \
            --disable-logger     \
            --disable-whois      \
            --disable-rcp        \
            --disable-rexec      \
            --disable-rlogin     \
            --disable-rsh        \
            --disable-servers

echo "MAKE INETUTILS"
make

echo "MAKE CHECK"
make check

echo "MAKE INSTALL"
make install

mv -v /usr/{,s}bin/ifconfig

