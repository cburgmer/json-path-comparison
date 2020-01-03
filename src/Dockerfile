FROM alpine:3.10

RUN apk --no-cache upgrade \
        && apk --no-cache add bash ninja python3 markdown curl coreutils

# Golang
RUN apk --no-cache add go git

# Rust
RUN apk --no-cache add cargo

# PHP
RUN apk --no-cache add php php-intl php-tokenizer composer

# JavaScript
RUN apk --no-cache add nodejs npm

# Java + Clojure + Kotlin
RUN apk --no-cache add openjdk11 maven

# Perl
RUN apk --no-cache add perl make wget

# C
RUN apk --no-cache add gcc json-glib-dev

# Haskell
RUN apk --no-cache add cabal ghc

# Erlang
# rebar3 as pkg only found in alpine:edge
RUN apk --no-cache add erlang erlang-crypto erlang-asn1 erlang-public-key erlang-ssl erlang-dev g++ \
        && curl -L https://s3.amazonaws.com/rebar3/rebar3 -o /usr/local/bin/rebar3 && chmod +x /usr/local/bin/rebar3

# Python
RUN curl https://bootstrap.pypa.io/get-pip.py -o /tmp/get-pip.py && python3 /tmp/get-pip.py

# .NET
ENV PATH="/root/.dotnet:${PATH}"
ENV DOTNET_ROOT="/root/.dotnet"
RUN curl -OL https://dotnetwebsite.azurewebsites.net/download/dotnet-core/scripts/v1/dotnet-install.sh \
        && chmod a+x dotnet-install.sh && ./dotnet-install.sh

# Elixir
RUN apk --no-cache add elixir
