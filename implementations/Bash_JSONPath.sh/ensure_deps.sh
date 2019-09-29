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

    if grep --version &> /dev/null && grep --version | grep 'BSD' &> /dev/null; then
        error=1
        >&2 echo "Make sure you have GNU grep or compatible installed"
    fi

    if ! sed --version &> /dev/null; then
        error=1
        >&2 echo "Make sure you have GNU sed or compatible installed"
    fi

    if [[ $error -gt 0 && is_osx ]]; then
        >&2 echo "With homebrew you may install necessary deps via \`brew install grep gnu-sed coreutils\`"
    fi

    return $error
}

main() {
    if is_osx; then
        export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
        export PATH="/usr/local/opt/grep/libexec/gnubin:$PATH"
        export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
    fi

    test_gnu_compat

    "$@"
}

main "$@"
