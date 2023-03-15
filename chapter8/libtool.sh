

TESTSUITEFLAGS=-j4

./configure --prefix=/usr

echo "MAKE LIBTOOL"
make

echo "MAKE CHECK LIBTOOL"
make -k check

echo "MAKE INSTALL LIBTOOL"
make install

rm -fv /usr/lib/libltdl.a

