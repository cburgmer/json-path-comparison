FROM ubuntu:24.04

# Hint: Put versioned dependencies (those that change ever so often) towards the
#       bottom, so that we can make use of Docker's layer cache (and we don't
#       rebuild the layers that do not change).
ARG TARGETARCH

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get -y upgrade && apt-get -y update && apt-get -y dist-upgrade \
        && apt-get install -y --no-install-recommends bash ninja-build python3 curl coreutils locales ca-certificates \
        && locale-gen en_US.UTF-8

# Rust
RUN curl https://sh.rustup.rs -sSf | sh -s -- --default-toolchain stable -y
ENV PATH="/root/.cargo/bin:${PATH}"

# JavaScript
RUN apt-get install -y --no-install-recommends nodejs npm unzip

# Perl
RUN apt-get install -y --no-install-recommends perl make wget

# C
RUN apt-get install -y --no-install-recommends gcc libjson-glib-dev

# Erlang
RUN apt-get install -y --no-install-recommends erlang erlang-crypto erlang-asn1 erlang-public-key erlang-ssl erlang-dev g++ rebar3

# Python
RUN apt-get install -y --no-install-recommends python3-pip

# .NET
ENV PATH="/root/.dotnet:${PATH}"
ENV DOTNET_ROOT="/root/.dotnet"
RUN curl -OL https://dot.net/v1/dotnet-install.sh \
    && chmod a+x dotnet-install.sh && ./dotnet-install.sh && rm dotnet-install.sh

# Elixir
RUN apt-get install -y --no-install-recommends elixir && mix local.hex --force

# Bash
RUN apt-get install -y --no-install-recommends sed grep gawk

# Ruby
RUN apt-get install -y --no-install-recommends ruby

# Dart
ARG DART_VERSION="3.10.7"
# Following https://medium.com/flutter-community/running-dart-on-arm-servers-7fd5f5eb99d
RUN apt-get install -y --no-install-recommends apt-transport-https gnupg2
RUN curl -O https://storage.googleapis.com/dart-archive/channels/stable/release/$DART_VERSION/sdk/dartsdk-linux-$TARGETARCH-release.zip \
    && unzip dartsdk-linux-$TARGETARCH-release.zip -d /usr/lib/ \
    && rm dartsdk-linux-$TARGETARCH-release.zip \
    && mv /usr/lib/dart-sdk /usr/lib/dart
ENV DART_SDK="/usr/lib/dart"
ENV PATH="${PATH}:${DART_SDK}/bin"

# Objective-C
RUN apt-get install -y --no-install-recommends build-essential git cmake clang libblocksruntime-dev libicu-dev libcurl4-openssl-dev patch
ADD installObjectiveC.sh /tmp/installObjectiveC.sh
ADD swift-corelibs-libdispatch_event_epoll.patch /tmp/swift-corelibs-libdispatch_event_epoll.patch
RUN chmod a+x /tmp/installObjectiveC.sh
RUN /tmp/installObjectiveC.sh

# Java + Clojure + Kotlin + Scala
RUN apt-get install -y --no-install-recommends openjdk-25-jdk maven

# Haskell
# Get newest cabal outside of Ubuntu channel
ARG CABAL_VERSION="3.18.1.0"
RUN apt-get install -y --no-install-recommends ghc xz-utils \
    && case "$TARGETARCH" in arm64) ARCH="aarch64";; *) ARCH="x86_64";; esac \
    && curl -L "https://downloads.haskell.org/~cabal/cabal-install-${CABAL_VERSION}/cabal-install-${CABAL_VERSION}-${ARCH}-linux-unknown.tar.xz" -o cabal-install.tar.xz \
    && tar -xf cabal-install.tar.xz \
    && mv cabal /usr/local/bin/ \
    && rm cabal-install.tar.xz

# Raku
RUN apt-get install -y --no-install-recommends rakudo raku-zef

# Golang
RUN apt-get install -y --no-install-recommends git
RUN cd /tmp \
    && curl -OL https://go.dev/dl/go1.27.1.linux-$TARGETARCH.tar.gz \
    && tar -zxf go*.tar.gz \
    && rm go*.tar.gz \
    && mv go /go
ENV PATH="${PATH}:/go/bin"
# Work around what's possibly tracked under https://github.com/golang/go/issues/49004
ENV GOFLAGS="-buildvcs=false"

# PHP
# Use latestest version from upstream not available in LTS
# RUN apt-get install -y --no-install-recommends php php-intl php-tokenizer composer
RUN apt-get install -y --no-install-recommends build-essential autoconf bison re2c pkg-config libssl-dev zlib1g-dev
ADD installPhp.sh /tmp/installPhp.sh
RUN chmod a+x /tmp/installPhp.sh

ARG PHP_VERSION_LATEST="8.5.11"
RUN /tmp/installPhp.sh "8.3.35"
RUN /tmp/installPhp.sh "$PHP_VERSION_LATEST"
RUN ln -s /root/php${PHP_VERSION_LATEST}/bin/php /usr/local/bin/php && ln -s /root/php${PHP_VERSION_LATEST}/bin/composer /usr/local/bin/composer

# Work around https://akashmittal.com/code-example-fatal-detected-dubious-ownership-in-repository-at/
# There seems to be no easy way in docker to make the current user the owner of mounted volumnes, e.g. https://github.com/moby/moby/issues/2259
RUN git config --global --add safe.directory '*'

# Swift
RUN case "$TARGETARCH" in arm64) ARCH="aarch64";; *) ARCH="x86_64";; esac \
    && curl -O https://download.swift.org/swiftly/linux/swiftly-$ARCH.tar.gz \
    && tar zxf swiftly-$ARCH.tar.gz \
    && ./swiftly init --quiet-shell-followup
ENV PATH="${PATH}:/root/.local/share/swiftly/bin"

# Dependencies for this project
#
# The following is not available yet in 24.04 LTS, hence use the preferred way of a virtual env
# RUN apt-get install -y --no-install-recommends python3-rfc8785
RUN apt-get update && apt-get install -y --no-install-recommends python3-venv \
    && python3 -m venv /venv \
    && . /venv/bin/activate \
    && python3 -m pip install rfc8785
ENV PATH="/venv/bin:$PATH"
