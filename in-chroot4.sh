

cd /sources

#CHAPTER *
for package in man-pages iana-etc glibc zlib bzip2 xz-utils zstd file readline m4 \
    bc flex tcl expect dejagnu binutils gmp mpfr mpc attr acl libcap shadow gcc \
    pkg-config ncurses sed psmisc gettext bison grep bash libtool gdbm gperf expat \
    inetutils less perl xml-parser intltool autoconf automake openssl kmod elfutils \
    libffi python wheel ninja meson coreutils check diffutils gawk findutils groff grub \
    gzip iproute2 kbd libpipeline make patch tar texinfo vim eudev man-db procps util-linux \
    e2fsprogs sysklogd sysvinit; do

    source packageinstall.sh 8 $package

done
