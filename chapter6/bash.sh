
./configure --prefix=/usr                      \
            --build=$(sh support/config.guess) \
            --host=$LFS_TGT                    \
            --without-bash-malloc

echo "MAKE BASH"
make

echo "MAKE INSTALL BASH"
make DESTDIR=$LFS install

ln -sv bash $LFS/bin/sh
