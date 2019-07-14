#!/bin/bash
set -euo pipefail

readonly script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
readonly jruby_jar_target="${script_dir}/jruby-complete.jar"
readonly gems_target="${script_dir}/gems"

cd "$script_dir"

if [[ ! -f "$jruby_jar_target" ]]; then
    curl -o "$jruby_jar_target" "https://repo1.maven.org/maven2/org/jruby/jruby-complete/9.2.7.0/jruby-complete-9.2.7.0.jar"
fi

if [[ ! -d "$gems_target" ]]; then
    >&2 java -jar "$jruby_jar_target" -S gem install -i "$gems_target" jsonpath
fi

# Work around https://github.com/jruby/jruby/issues/4834
GEM_PATH="$gems_target" java \
        --add-opens java.base/sun.nio.ch=ALL-UNNAMED \
        --add-opens java.base/java.io=ALL-UNNAMED \
        --add-opens java.base/java.lang=ALL-UNNAMED \
        --add-opens java.base/java.lang.reflect=ALL-UNNAMED \
        --add-opens java.base/java.util.regex=ALL-UNNAMED \
        --add-opens java.base/java.net=ALL-UNNAMED \
        --add-opens java.base/java.util=ALL-UNNAMED \
        --add-opens java.base/javax.crypto=ALL-UNNAMED \
        -jar "$jruby_jar_target" --dev main.rb "$@"
