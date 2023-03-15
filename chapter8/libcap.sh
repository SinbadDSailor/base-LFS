

sed -i '/install -m.*STA/d' libcap/Makefile

echo "MAKE LIBCAP"
make prefix=/usr lib=lib

echo "MAKE TEST LIBCAP"
make test

echo "MAKE INSTALL LIBCAP"
make prefix=/usr lib=lib install

