

case $(uname -m) in
    i?86)   TIME_T_32_BIT_OK=yes ./configure --prefix=/usr --localstatedir=/var/lib/locate ;;
    x86_64) ./configure --prefix=/usr --localstatedir=/var/lib/locate ;;
esac

echo "MAKE FINDUTILS"
make

echo "MAKE CHECK FINDUTILS"
chown -Rv tester .
su tester -c "PATH=$PATH make check"

echo "MAKE INSTALL FINDUTILS"
make install

