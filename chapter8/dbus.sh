

./configure --prefix=/usr                        \
            --sysconfdir=/etc                    \
            --localstatedir=/var                 \
            --runstatedir=/run                   \
            --disable-static                     \
            --disable-doxygen-docs               \
            --disable-xml-docs                   \
            --docdir=/usr/share/doc/dbus-1.14.6  \
            --with-system-socket=/run/dbus/system_bus_socket

echo "MAKE DBUS"
make

echo "MAKE INSTALL DBUS"
make install

ln -sfv /etc/machine-id /var/lib/dbus

