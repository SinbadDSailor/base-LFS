

sed -i 's/extras//' Makefile.in

./configure --prefix=/usr

echo "MAKE GAWK"
make

echo "MAKE CHECK GAWK"
make check

echo "MAKE INSTALL GAWK"
make LN='ln -f' install

mkdir -pv /usr/share/doc/gawk-5.2.1
cp -v doc/{awkforai.txt,*.{eps,pdf,jpg}} /usr/share/doc/gawk-5.2.1

