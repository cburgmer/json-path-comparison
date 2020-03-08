FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
        && apt-get install -y --no-install-recommends bash ninja-build python3 markdown curl coreutils

# Golang
RUN apt-get install -y --no-install-recommends golang-go git

# Rust
RUN apt-get install -y --no-install-recommends cargo

# PHP
RUN apt-get install -y --no-install-recommends php php-intl php-tokenizer composer

# JavaScript
RUN apt-get install -y --no-install-recommends nodejs npm unzip

# Java + Clojure + Kotlin
RUN apt-get install -y --no-install-recommends openjdk-11-jdk maven

# Perl
RUN apt-get install -y --no-install-recommends perl make wget

# C
RUN apt-get install -y --no-install-recommends gcc libjson-glib-dev

# Haskell
# Get newest cabal outside of Ubuntu channel
RUN apt-get install -y --no-install-recommends ghc xz-utils \
        && curl -L https://downloads.haskell.org/~cabal/cabal-install-latest/cabal-install-3.0.0.0-x86_64-unknown-linux.tar.xz -o cabal-install.tar.xz \
        && tar -xf cabal-install.tar.xz \
        && mv cabal /usr/local/bin/ \
        && rm cabal-install.tar.xz

# Erlang
# rebar3 as pkg only found in alpine:edge
RUN apt-get install -y --no-install-recommends erlang erlang-crypto erlang-asn1 erlang-public-key erlang-ssl erlang-dev g++ \
        && curl -L https://s3.amazonaws.com/rebar3/rebar3 -o /usr/local/bin/rebar3 && chmod +x /usr/local/bin/rebar3

# Python
RUN curl https://bootstrap.pypa.io/get-pip.py -o /tmp/get-pip.py && python3 /tmp/get-pip.py

# .NET
ENV PATH="/root/.dotnet:${PATH}"
ENV DOTNET_ROOT="/root/.dotnet"
RUN curl -OL https://dotnetwebsite.azurewebsites.net/download/dotnet-core/scripts/v1/dotnet-install.sh \
        && chmod a+x dotnet-install.sh && ./dotnet-install.sh

# Elixir
RUN apt-get install -y --no-install-recommends elixir && mix local.hex --force

# Bash
RUN apt-get install -y --no-install-recommends sed grep gawk

# Swift
RUN apt-get install -y --no-install-recommends clang libicu-dev libtinfo5 libncurses5 \
        && curl -LO https://swift.org/builds/swift-5.1.4-release/ubuntu1804/swift-5.1.4-RELEASE/swift-5.1.4-RELEASE-ubuntu18.04.tar.gz \
        && tar -xzf swift-5.1.4-RELEASE-ubuntu18.04.tar.gz \
        && mv swift-5.1.4-RELEASE-ubuntu18.04 /swift
ENV PATH="/swift/usr/bin:${PATH}"
