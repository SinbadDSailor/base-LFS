

./configure --prefix=/usr

echo "MAKE LIBPIPELINE"
make

echo "MAKE CHECK LIBPIPELINE"
make check

echo "MAKE INSTALL LIBPIPELINE"
make install

