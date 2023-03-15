

expect -c "spawn ls"

if expect -c "spawn ls" | grep -q "spawn ls"; then
    echo "Error occured"
    echo "Exiting.."
    exit
else
    echo "Test completed successfully"
fi


mkdir -v build
cd build

../configure --prefix=/usr       \
             --sysconfdir=/etc   \
             --enable-gold       \
             --enable-ld=default \
             --enable-plugins    \
             --enable-shared     \
             --disable-werror    \
             --enable-64-bit-bfd \
             --with-system-zlib

echo "MAKE BINUTILS"
make tooldir=/usr

echo "MAKE TEST BINUTILS"
make -k check

grep '^FAIL:' $(find -name '*.log')

echo "MAKE INSTALL BINUTILS"
make tooldir=/usr install

rm -fv /usr/lib/lib{bfd,ctf,ctf-nobfd,sframe,opcodes}.a
rm -fv /usr/share/man/man1/{gprofng,gp-*}.1

