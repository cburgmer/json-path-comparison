FROM ubuntu:22.04

# Hint: Put versioned dependencies (those that change ever so often) towards the
#       bottom, so that we can make use of Docker's layer cache (and we don't
#       rebuild the layers that do not change).

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get -y upgrade && apt-get -y update && apt-get -y dist-upgrade \
        && apt-get install -y --no-install-recommends bash ninja-build python3 curl coreutils locales ca-certificates \
        && locale-gen en_US.UTF-8

# Golang
RUN apt-get install -y --no-install-recommends golang-go git
# Work around what's possibly tracked under https://github.com/golang/go/issues/49004
ENV GOFLAGS="-buildvcs=false"

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
RUN apt-get install -y --no-install-recommends erlang erlang-crypto erlang-asn1 erlang-public-key erlang-ssl erlang-dev g++ \
        && curl -L https://s3.amazonaws.com/rebar3/rebar3 -o /usr/local/bin/rebar3 && chmod +x /usr/local/bin/rebar3

# Python
RUN curl https://bootstrap.pypa.io/get-pip.py -o /tmp/get-pip.py && python3 /tmp/get-pip.py

# .NET
ENV PATH="/root/.dotnet:${PATH}"
ENV DOTNET_ROOT="/root/.dotnet"
RUN curl -OL https://dot.net/v1/dotnet-install.sh \
    && chmod a+x dotnet-install.sh && ./dotnet-install.sh && rm dotnet-install.sh

# Elixir
RUN apt-get install -y --no-install-recommends elixir && mix local.hex --force

# Bash
RUN apt-get install -y --no-install-recommends sed grep gawk

# Objective-C
RUN apt-get install -y --no-install-recommends build-essential cmake clang libblocksruntime-dev libicu-dev libdispatch-dev
ADD installObjectiveC.sh /tmp/installObjectiveC.sh
RUN chmod a+x /tmp/installObjectiveC.sh
RUN /tmp/installObjectiveC.sh

# Raku
RUN apt-get install -y --no-install-recommends rakudo
# Work around zef being dropped? in Ubuntu 22.04 (was perl6-zef, might become raku-zef in newer versions)
RUN curl -LO https://github.com/ugexe/zef/archive/refs/tags/v0.11.7.tar.gz \
    && tar -xzf v*.tar.gz \
    && rm v*.tar.gz \
    && cd zef-* \
    && raku -I. bin/zef install .
ENV PATH="/usr/lib/perl6/site/bin:${PATH}"

# Ruby
RUN apt-get install -y --no-install-recommends ruby

# Dart
RUN apt-get install -y --no-install-recommends apt-transport-https gnupg2
RUN sh -c 'wget -qO- https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -'
RUN sh -c 'wget -qO- https://storage.googleapis.com/download.dartlang.org/linux/debian/dart_stable.list > /etc/apt/sources.list.d/dart_stable.list'
RUN apt-get update && apt-get install dart

# Java + Clojure + Kotlin + Scala
RUN apt-get install -y --no-install-recommends openjdk-17-jdk maven

# Swift
RUN apt-get install -y --no-install-recommends clang libicu-dev libtinfo5 libncurses5 \
    && curl -LO https://download.swift.org/swift-5.6.3-release/ubuntu2004/swift-5.6.3-RELEASE/swift-5.6.3-RELEASE-ubuntu20.04.tar.gz \
    && tar -xzf swift-*.tar.gz \
    && rm swift-*.tar.gz \
    && mv swift-* /swift
ENV PATH="/swift/usr/bin:${PATH}"

# Haskell
# Get newest cabal outside of Ubuntu channel
RUN apt-get install -y --no-install-recommends ghc xz-utils \
        && curl -L https://downloads.haskell.org/~cabal/cabal-install-3.6.2.0/cabal-install-3.6.2.0-x86_64-linux-deb10.tar.xz -o cabal-install.tar.xz \
        && tar -xf cabal-install.tar.xz \
        && mv cabal /usr/local/bin/ \
        && rm cabal-install.tar.xz

# Work around https://akashmittal.com/code-example-fatal-detected-dubious-ownership-in-repository-at/
# There seems to be no easy way in docker to make the current user the owner of mounted volumnes, e.g. https://github.com/moby/moby/issues/2259
RUN git config --global --add safe.directory '*'
