

echo "MAKE ZSTD"
make prefix=/usr

echo "MAKE CHECK ZSTD"
make check

echo "MAKE INSTALL ZSTD"
make prefix=/usr install

rm -v /usr/lib/libzstd.a

