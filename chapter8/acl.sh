

./configure --prefix=/usr         \
            --disable-static      \
            --docdir=/usr/share/doc/acl-2.3.1

echo "MAKE ACL"
make

echo "MAKE INSTALL ACL"
make install

