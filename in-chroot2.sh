

touch /var/log/{btmp,lastlog,faillog,wtmp}
chgrp -v utmp /var/log/lastlog
chmod -v 664  /var/log/lastlog
chmod -v 600  /var/log/btmp

cd /sources


# CHAPTER 7
for package in gettext bison perl python texinfo util-linux; do
    source packageinstall.sh 7 $package
done
