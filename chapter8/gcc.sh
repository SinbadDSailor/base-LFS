

case $(uname -m) in
  x86_64)
    sed -e '/m64=/s/lib64/lib/' \
        -i.orig gcc/config/i386/t-linux64
  ;;
esac

mkdir -v build
cd build

../configure --prefix=/usr            \
             LD=ld                    \
             --enable-languages=c,c++ \
             --enable-default-pie     \
             --enable-default-ssp     \
             --disable-multilib       \
             --disable-bootstrap      \
             --with-system-zlib

echo "MAKE GCC"
make

ulimit -s 32768

echo "TEST GCC"
chown -Rv tester .
su tester -c "PATH=$PATH make -k check -j4"

../contrib/test_summary

echo "MAKE INSTALL GCC"
make install

chown -v -R root:root \
    /usr/lib/gcc/$(gcc -dumpmachine)/12.2.0/include{,-fixed}

ln -svr /usr/bin/cpp /usr/lib

ln -sfv ../../libexec/gcc/$(gcc -dumpmachine)/12.2.0/liblto_plugin.so \
        /usr/lib/bfd-plugins/

echo 'int main(){}' > dummy.c
cc dummy.c -v -Wl,--verbose &> dummy.log
readelf -l a.out | grep ': /lib'

sleep 5

grep -E -o '/usr/lib.*/S?crt[1in].*succeeded' dummy.log

sleep 5

grep -B4 '^ /usr/include' dummy.log

sleep 5

grep 'SEARCH.*/usr/lib' dummy.log |sed 's|; |\n|g'

sleep 5

grep "/lib.*/libc.so.6 " dummy.log

sleep 5

grep found dummy.log

sleep 5

rm -v dummy.c a.out dummy.log

mkdir -pv /usr/share/gdb/auto-load/usr/lib
mv -v /usr/lib/*gdb.py /usr/share/gdb/auto-load/usr/lib

