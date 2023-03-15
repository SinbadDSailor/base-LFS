

./configure --prefix=/usr --docdir=/usr/share/doc/gperf-3.1

echo "MAKE GPERF"
make

echo "MAKE CHECK GPERF"
make -j1 check

echo "MAKE INSTALL GPERF"
make install

