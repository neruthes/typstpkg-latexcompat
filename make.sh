#!/bin/bash

case $1 in
    src/ )
        # rsync -avpx src/master/ latexcompat/
        cat src/master/components/*.typ > src/master/latexcompat.typ
        ;;
    examples/*.typ )
        typst c --root . "$1"
        ;;
esac
