#!/usr/bin/env bash
set -euo pipefail

is_osx() {
    test "$(uname -s)" == "Darwin"
}

test_gnu_compat() {
    local error=0
    if ! seq 0 -1 1 &> /dev/null; then
        error=1
        >&2 echo "Make sure you have GNU coreutils installed"
    fi

    if grep --version | grep 'BSD' &> /dev/null; then
        error=1
        >&2 echo "Make sure you have GNU grep or compatible installed"
    fi

    if ! sed --version &> /dev/null; then
        error=1
        >&2 echo "Make sure you have GNU sed or compatible installed"
    fi

    if [[ $error -gt 0 ]] && is_osx; then
        >&2 echo "With homebrew you may install necessary deps via \`brew install grep gnu-sed coreutils\`"
        >&2 echo 'Put /opt/homebrew/bin/gsed early in your PATH'
        >&2 echo 'Then put /opt/homebrew/bin/ggrep early in your PATH'
        >&2 echo 'And put /opt/homebrew/var/homebrew/linked/coreutils/libexec/gnubin early in your PATH'
        >&2 echo "For example: PATH=$PATH"
    fi

    return "$error"
}

main() {
    if is_osx; then
        export PATH="/opt/homebrew/bin/gsed:$PATH"
        export PATH="/opt/homebrew/bin/ggrep:$PATH"
        export PATH="/opt/homebrew/var/homebrew/linked/coreutils/libexec/gnubin:$PATH"
    fi

    test_gnu_compat

    "$@"
}

main "$@"
