echo "MAKE API MRPROPER"
make mrproper
sleep 5

echo "MAKE API HEADERS"
make headers
sleep 5

find usr/include -type f ! -name '*.h' -delete
cp -rv usr/include $LFS/usr
