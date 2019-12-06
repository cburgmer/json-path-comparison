FROM alpine:3.10

RUN apk --no-cache upgrade \
        && apk --no-cache add bash ninja python3 markdown curl \
        coreutils \
        go git \
        cargo \
        php php-intl php-tokenizer composer \
        nodejs npm \
        openjdk11 maven \
        perl make wget \
        gcc json-glib-dev \
        cabal ghc

# Erlang
# rebar3 as pck only found in alpine:edge
RUN apk --no-cache add erlang erlang-crypto erlang-asn1 erlang-public-key erlang-ssl erlang-dev g++ \
        && curl -L https://s3.amazonaws.com/rebar3/rebar3 -o /usr/local/bin/rebar3 && chmod +x /usr/local/bin/rebar3

# Python
RUN curl https://bootstrap.pypa.io/get-pip.py -o /tmp/get-pip.py && python3 /tmp/get-pip.py
