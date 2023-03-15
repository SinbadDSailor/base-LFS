

./configure --disable-shared

echo "MAKE GETTEXT"
make
sleep 3

echo "INSTALL MSGFMT MSGMERGE ZGETTEXT"
cp -v gettext-tools/src/{msgfmt,msgmerge,xgettext} /usr/bin
sleep 3
