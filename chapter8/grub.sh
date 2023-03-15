

unset {C,CPP,CXX,LD}FLAGS

echo "PATCH GRUB"
patch -Np1 -i ../grub-2.06-upstream_fixes-1.patch

./configure --prefix=/usr          \
            --sysconfdir=/etc      \
            --disable-efiemu       \
            --disable-werror

echo "MAKE GRUB"
make

echo "MAKE INSTALL GRUB"
make install
mv -v /etc/bash_completion.d/grub /usr/share/bash-completion/completions

