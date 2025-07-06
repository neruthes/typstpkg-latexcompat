#!/bin/bash

if [[ -e "$2" ]]; then
    for arg in "$@"; do
        ./make.sh "$arg" || exit $?
    done
    exit $?
fi

case $1 in
    src/ )
        # rsync -avpx src/master/ latexcompat/
        cat src/master/components/*.typ > src/master/latexcompat.typ
        ;;
    examples/*.typ )
        typst c --root . "$1"
        ;;
    '' )
        ./make.sh src/
        ;;
esac
