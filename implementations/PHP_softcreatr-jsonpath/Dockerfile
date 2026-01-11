FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get -y upgrade && apt-get -y update && apt-get -y dist-upgrade \
    && apt-get install -y --no-install-recommends bash curl coreutils locales ca-certificates \
    && locale-gen en_US.UTF-8

RUN apt-get install -y --no-install-recommends build-essential autoconf bison re2c pkg-config libssl-dev zlib1g-dev libicu-dev
ADD installPhp.sh /tmp/installPhp.sh
RUN chmod a+x /tmp/installPhp.sh

ARG PHP_VERSION_LATEST="8.5.1"
RUN /tmp/installPhp.sh "$PHP_VERSION_LATEST"
RUN ln -s /root/php${PHP_VERSION_LATEST}/bin/php /usr/local/bin/php && ln -s /root/php${PHP_VERSION_LATEST}/bin/composer /usr/local/bin/composer
