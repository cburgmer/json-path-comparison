#!/usr/bin/env bash
set -euo pipefail

is_osx() {
    test "$(uname -s)" == "Darwin"
}

test_deps() {
    local dep
    for dep in ninja java mvn cargo git go node unzip python3 markdown php composer curl gcc g++ pkg-config perl wget ghc cabal erl rebar3 dotnet elixir gawk clang; do
        if ! which "$dep" > /dev/null; then
            echo >&2 "Please install $dep"
            echo >&2 "If you use homebrew you might want to use ./src/Brewfile"
            exit 1
        fi
    done

    if ! php --version | grep 'PHP 7.4' > /dev/null; then
        echo >&2 "Please install PHP 7.4"
        exit 1
    fi

    if ! pkg-config --cflags "$dep" > /dev/null; then
        export PKG_CONFIG_PATH="/usr/local/opt/zlib/lib/pkgconfig"
    fi
    for dep in glib-2.0 json-glib-1.0 gio-unix-2.0; do
        if ! pkg-config --cflags "$dep" > /dev/null; then
            exit 1
        fi
    done
}

main() {
    if is_osx; then
        export PATH="/usr/local/opt/php@7.4/bin:$PATH"
    fi

    test_deps

    "$@"
}

main "$@"
