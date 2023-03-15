

sed -i "s/echo/#echo/" src/egrep.sh

./configure --prefix=/usr

echo "MAKE GREP"
make

echo "MAKE CHECK GREP"
make check

echo "MAKE INSTALL GREP"
make install

