FROM ubuntu:24.04

# Hint: Put versioned dependencies (those that change ever so often) towards the
#       bottom, so that we can make use of Docker's layer cache (and we don't
#       rebuild the layers that do not change).

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get -y upgrade && apt-get -y update && apt-get -y dist-upgrade \
        && apt-get install -y --no-install-recommends bash ninja-build python3 curl coreutils locales ca-certificates \
        && locale-gen en_US.UTF-8

# Rust
RUN curl https://sh.rustup.rs -sSf | sh -s -- --default-toolchain stable -y
ENV PATH="/root/.cargo/bin:${PATH}"

# PHP
RUN apt-get install -y --no-install-recommends php php-intl php-tokenizer composer

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
ARG DART_VERSION="3.4.0"
# Following https://medium.com/flutter-community/running-dart-on-arm-servers-7fd5f5eb99d
RUN apt-get install -y --no-install-recommends apt-transport-https gnupg2
RUN case "$(uname -m)" in armv7l | armv7) ARCH="arm";; aarch64) ARCH="arm64";; *) ARCH="x64";; esac \
    && curl -O https://storage.googleapis.com/dart-archive/channels/stable/release/$DART_VERSION/sdk/dartsdk-linux-$ARCH-release.zip \
    && unzip dartsdk-linux-$ARCH-release.zip -d /usr/lib/ \
    && rm dartsdk-linux-$ARCH-release.zip \
    && mv /usr/lib/dart-sdk /usr/lib/dart
ENV DART_SDK="/usr/lib/dart"
ENV PATH="${PATH}:${DART_SDK}/bin"

# Objective-C
RUN apt-get install -y --no-install-recommends build-essential git cmake clang libblocksruntime-dev libicu-dev
ADD installObjectiveC.sh /tmp/installObjectiveC.sh
RUN chmod a+x /tmp/installObjectiveC.sh
RUN /tmp/installObjectiveC.sh

# Java + Clojure + Kotlin + Scala
RUN apt-get install -y --no-install-recommends openjdk-21-jdk maven

# Swift
RUN apt-get install -y --no-install-recommends clang libicu-dev libtinfo6 libncurses6 \
    && case "$(uname -m)" in aarch64) URL="https://download.swift.org/swift-5.10.1-release/ubuntu2404-aarch64/swift-5.10.1-RELEASE/swift-5.10.1-RELEASE-ubuntu24.04-aarch64.tar.gz";; *) URL="https://download.swift.org/swift-5.10.1-release/ubuntu2404/swift-5.10.1-RELEASE/swift-5.10.1-RELEASE-ubuntu24.04.tar.gz";; esac \
    && curl -LO "$URL" \
    && tar -xzf swift-*.tar.gz \
    && rm swift-*.tar.gz \
    && mv swift-* /swift
ENV PATH="${PATH}:/swift/usr/bin"

# Haskell
# Get newest cabal outside of Ubuntu channel
RUN apt-get install -y --no-install-recommends ghc xz-utils \
    && case "$(uname -m)" in aarch64) URL="https://downloads.haskell.org/~cabal/cabal-install-3.12.1.0/cabal-install-3.12.1.0-aarch64-linux-deb12.tar.xz";; *) URL="https://downloads.haskell.org/~cabal/cabal-install-3.12.1.0/cabal-install-3.12.1.0-x86_64-linux-ubuntu22_04.tar.xz";; esac \
    && curl -L "$URL" -o cabal-install.tar.xz \
    && tar -xf cabal-install.tar.xz \
    && mv cabal /usr/local/bin/ \
    && rm cabal-install.tar.xz

# Raku
RUN apt-get install -y --no-install-recommends rakudo
# Work around zef being dropped? in Ubuntu 22.04 (was perl6-zef, might become raku-zef in newer versions)
RUN curl -LO https://github.com/ugexe/zef/archive/refs/tags/v1.0.0.tar.gz \
    && tar -xzf v*.tar.gz \
    && rm v*.tar.gz \
    && cd zef-* \
    && raku -I. bin/zef install .
ENV PATH="/usr/lib/perl6/site/bin:${PATH}"

# Golang
RUN apt-get install -y --no-install-recommends git
RUN case "$(uname -m)" in aarch64) ARCH="arm64";; *) ARCH="amd64";; esac \
    && cd /tmp \
    && curl -OL https://go.dev/dl/go1.22.5.linux-$ARCH.tar.gz \
    && tar -zxf go*.tar.gz \
    && rm go*.tar.gz \
    && mv go /go
ENV PATH="${PATH}:/go/bin"
# Work around what's possibly tracked under https://github.com/golang/go/issues/49004
ENV GOFLAGS="-buildvcs=false"

# Work around https://akashmittal.com/code-example-fatal-detected-dubious-ownership-in-repository-at/
# There seems to be no easy way in docker to make the current user the owner of mounted volumnes, e.g. https://github.com/moby/moby/issues/2259
RUN git config --global --add safe.directory '*'

# Dependencies for this project
#
# The following is not available yet in 24.04 LTS, hence use the preferred way of a virtual env
# RUN apt-get install -y --no-install-recommends python3-rfc8785
RUN apt-get update && apt-get install -y --no-install-recommends python3-venv \
    && python3 -m venv /venv \
    && . /venv/bin/activate \
    && python3 -m pip install rfc8785
ENV PATH="/venv/bin:$PATH"
