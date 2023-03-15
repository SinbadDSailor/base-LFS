

./configure --prefix=/usr

echo "MAKE SED"
make
make html

echo "TEST SED"
chown -Rv tester .
su tester -c "PATH=$PATH make check"

echo "MAKE INSTALL SED"
make install
install -d -m755 /usr/share/doc/sed-4.9
install -m644 doc/sed.html /usr/share/doc/sed-4.9

