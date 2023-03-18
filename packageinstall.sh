
CHAPTER="$1"
PACKAGE="$2"

if [ "$PACKAGE" = "libstdc" ]; then
    PACKAGE="gcc"
    PACKMARKER="glc"
fi

cat packages.csv | grep -i "^$PACKAGE;" | grep -i -v "\.patch;" | while read line; do
    VERSION="`echo $line | cut -d\; -f2`"
    URL="`echo $line | cut -d\; -f3 | sed "s/@/$VERSION/g"`"
    CACHEFILE="$(basename "$URL")"
    DIRNAME="$(echo "$CACHEFILE" | sed 's/\(.*\)\.tar\..*/\1/')"

    echo "Extracting $CACHEFILE"
    tar -xvf "$CACHEFILE"

    if [ "$PACKAGE" = "tcl" ]; then
        DIRNAME="tcl$VERSION"
    fi

    pushd "$DIRNAME"
        echo "Compiling $PACKAGE"
        sleep 5

        mkdir -pv "../log/chapter$CHAPTER/"

        if [ "$PACKMARKER" = "glc" ]; then
            PACKAGE="libstdc"
            source "../chapter$CHAPTER/$PACKAGE.sh" 2>&1 | tee "../log/chapter$CHAPTER/$PACKAGE.log"
        else
            source "../chapter$CHAPTER/$PACKAGE.sh" 2>&1 | tee "../log/chapter$CHAPTER/$PACKAGE.log"
        fi
        echo "Done compiling $PACKAGE"

    popd

    rm -rf $DIRNAME

    sleep 5

done
