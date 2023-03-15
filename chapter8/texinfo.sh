

./configure --prefix=/usr

echo "MAKE TEXINFO"
make

echo "MAKE CHECK TEXINFO"
make check

echo "MAKE INSTALL TEXINFO"
make install

make TEXMF=/usr/share/texmf install-tex

pushd /usr/share/info
  rm -v dir
  for f in *
    do install-info $f dir 2>/dev/null
  done
popd

