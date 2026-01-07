#!/usr/bin/env bash
# https://php.watch/articles/compile-php-ubuntu
set -euo pipefail

readonly PHP_VERSION="$1"

curl -LO "https://github.com/php/php-src/archive/refs/tags/php-${PHP_VERSION}.tar.gz"
tar -xzf php-*.tar.gz
rm php-*.tar.gz

cd php-src-php-*/
./buildconf --force
./configure --prefix="/root/php${PHP_VERSION}" --disable-all --with-openssl --enable-phar --enable-filter --with-iconv --with-zlib --enable-tokenizer --enable-intl
make -j "$(nproc)"
make install
cd - && rm -r php-src-php-*/

"/root/php${PHP_VERSION}/bin/php" -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
"/root/php${PHP_VERSION}/bin/php" composer-setup.php
rm composer-setup.php
mv composer.phar "/root/php${PHP_VERSION}/bin/composer"
