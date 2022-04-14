FROM ubuntu:21.04

# Hint: Put versioned dependencies (those that change ever so often) towards the
#       bottom, so that we can make use of Docker's layer cache (and we don't
#       rebuild the layers that do not change).

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get -y upgrade && apt-get -y update && apt-get -y dist-upgrade \
        && apt-get install -y --no-install-recommends bash ninja-build python3 curl coreutils locales ca-certificates \
        && locale-gen en_US.UTF-8

# Golang
RUN apt-get install -y --no-install-recommends golang-go git

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
        && chmod a+x dotnet-install.sh && ./dotnet-install.sh

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
RUN apt-get install -y --no-install-recommends rakudo perl6-zef

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
        && curl -LO https://download.swift.org/swift-5.5.2-release/ubuntu2004/swift-5.5.2-RELEASE/swift-5.5.2-RELEASE-ubuntu20.04.tar.gz \
        && tar -xzf swift-5.5.2-RELEASE-ubuntu20.04.tar.gz \
        && mv swift-5.5.2-RELEASE-ubuntu20.04 /swift
ENV PATH="/swift/usr/bin:${PATH}"

# Haskell
# Get newest cabal outside of Ubuntu channel
RUN apt-get install -y --no-install-recommends ghc xz-utils \
        && curl -L https://downloads.haskell.org/~cabal/cabal-install-3.6.2.0/cabal-install-3.6.2.0-x86_64-linux-deb10.tar.xz -o cabal-install.tar.xz \
        && tar -xf cabal-install.tar.xz \
        && mv cabal /usr/local/bin/ \
        && rm cabal-install.tar.xz

