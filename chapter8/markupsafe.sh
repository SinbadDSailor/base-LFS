

echo "MAKE MARKUPSAFE"
pip3 wheel -w dist --no-build-isolation --no-deps $PWD

echo "MAKE INSTALL MARKUPSAFE"
pip3 install --no-index --no-user --find-links dist Markupsafe

