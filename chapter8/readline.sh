

sed -i '/MV.*old/d' Makefile.in
sed -i '/{OLDSUFF}/c:' support/shlib-install

echo "PATCH READLINE"
patch -Np1 -i ../readline-8.2-upstream_fix-1.patch

./configure --prefix=/usr    \
            --disable-static \
            --with-curses    \
            --docdir=/usr/share/doc/readline-8.2

echo "MAKE READLINE"
make SHLIB_LIBS="-lncursesw"

echo "MAKE INSTALL READLINE"
make SHLIB_LIBS="-lncursesw" install

echo "INSTALL READLINE DOCUMENTATION"
install -v -m644 doc/*.{ps,pdf,html,dvi} /usr/share/doc/readline-8.2

