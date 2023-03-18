

echo "MAKE JINJA2"
pip3 wheel -w dist --no-build-isolation --no-deps $PWD

echo "MAKE INSTALL JINJA2"
pip3 install --no-index --no-user --find-links dist Jinja2

