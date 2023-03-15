

cat packages.csv | while read line; do
    NAME="`echo $line | cut -d\; -f1`"
    VERSION="`echo $line | cut -d\; -f2`"
    URL="`echo $line | cut -d\; -f3 | sed "s/@/$VERSION/g"`"
    MD5SUM="`echo $line | cut -d\; -f4`"
    MIRRORURL="`echo $line | cut -d\; -f5 | sed "s/@/$VERSION/g"`"
    CACHEFILE="$(basename "$URL")"



    if [ ! -f "$CACHEFILE" ]; then
        echo "Downloading $URL"
        wget "$URL"
        if ! echo "$MD5SUM $CACHEFILE" | md5sum -c >/dev/null; then
            rm -f "$CACHEFILE"
            echo "Verification of $CACHEFILE failed!"
            echo "Downloading from mirror URL: $MIRRORURL"
            wget "$MIRRORURL"
        fi
    fi

done
