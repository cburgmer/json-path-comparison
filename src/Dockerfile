FROM alpine:3.10

RUN apk --no-cache upgrade && \
    apk --no-cache add bash coreutils ninja cargo git go python3 markdown php php-intl php-tokenizer composer nodejs npm openjdk11 maven gcc json-glib-dev curl && \
    curl https://bootstrap.pypa.io/get-pip.py -o /tmp/get-pip.py && python3 /tmp/get-pip.py
