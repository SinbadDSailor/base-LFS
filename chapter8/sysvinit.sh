

echo "PATCH SYSVINIT"
patch -Np1 -i ../sysvinit-3.06-consolidated-1.patch

echo "MAKE SYSVINIT"
make

echo "MAKE INSTALL SYSVINIT"
make install

