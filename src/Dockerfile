FROM alpine:3.10

RUN apk --no-cache upgrade \
        && apk --no-cache add bash ninja python3 markdown \
        coreutils \
        go git \
        cargo \
        php php-intl php-tokenizer composer \
        nodejs npm \
        openjdk11 maven \
        perl make wget \
        gcc json-glib-dev \
        curl \
        cabal ghc \
        && curl https://bootstrap.pypa.io/get-pip.py -o /tmp/get-pip.py && python3 /tmp/get-pip.py
