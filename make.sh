#!/bin/bash

function _die() {
    echo "$2" > /dev/stderr
    exit "$1"
}

if [[ -e "$2" ]]; then
    for arg in "$@"; do
        ./make.sh "$arg" || exit $?
    done
    exit $?
fi



case "$1" in
    src/ )
        # rsync -avpx src/master/ latexcompat/
        cat src/master/components/*.typ > src/master/latexcompat.typ
        ;;
    examples/*.typ )
        command -v typst || _die 1 "ERROR: Make target 'install_local' requires typst"
        typst c --root . "$1"
        ;;
    docs/*.typ )
        typst c --root . "$1"
        ;;
    install_local )
        command -v tomlq || _die 1 "ERROR: Make target 'install_local' requires tomlq"
        command -v rsync || _die 1 "ERROR: Make target 'install_local' requires rsync"
        VER="$(tomlq -r .package.version src/master/typst.toml)"
        rsync -auv --delete --mkpath src/master/ "$HOME"/.local/share/typst/packages/local/latexcompat/"$VER"
        ;;
    fast )
        ./make.sh src/
        ./make.sh install_local
        ;;
    '' )
        ./make.sh src/
        ;;
    * )
        die 1 "WARNING: No rule to make target '$1'"
        ;;
esac
