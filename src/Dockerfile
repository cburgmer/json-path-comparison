FROM alpine:3.10

RUN apk --no-cache upgrade && \
        apk --no-cache add bash ninja python3 markdown \
        coreutils \
        go git \
        cargo \
        php php-intl php-tokenizer composer \
        nodejs npm \
        openjdk11 maven \
        perl make wget \
        gcc json-glib-dev \
        curl \
        g++ gmp-dev ncurses-dev libffi-dev xz tar \
        && curl https://bootstrap.pypa.io/get-pip.py -o /tmp/get-pip.py && python3 /tmp/get-pip.py

ENV PATH="/root/.ghcup/bin:${PATH}"

RUN mkdir -p /root/.ghcup/bin \
  && curl https://gitlab.haskell.org/haskell/ghcup/raw/master/ghcup -o /root/.ghcup/bin/ghcup \
  && chmod +x /root/.ghcup/bin/ghcup \
  && ghcup install-cabal 2.4.1.0 \
  && ghcup install 8.6.5 \
  && ghcup set 8.6.5
