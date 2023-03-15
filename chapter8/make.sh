

sed -e '/ifdef SIGPIPE/,+2 d' \
    -e '/undef  FATAL_SIG/i FATAL_SIG (SIGPIPE);' \
    -i src/main.c

./configure --prefix=/usr

echo "MAKE MAKE"
make

echo "MAKE CHECK MAKE"
make check

echo "MAKE INSTALL MAKE"
make install

