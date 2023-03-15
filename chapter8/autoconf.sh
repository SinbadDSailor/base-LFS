

sed -e 's/SECONDS|/&SHLVL|/'               \
    -e '/BASH_ARGV=/a\        /^SHLVL=/ d' \
    -i.orig tests/local.at

./configure --prefix=/usr

echo "MAKE AUTOCONF"
make

TESTSUITEFLAGS=-j4

echo "MAKE CHECK AUTOCONF"
make check

echo "MAKE INSTALL AUTOCONF"
make install

