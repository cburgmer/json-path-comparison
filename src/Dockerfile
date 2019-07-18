FROM alpine:3.10

RUN apk --no-cache upgrade && \
    apk --no-cache add bash ninja cargo python3 markdown php composer nodejs npm openjdk11 maven curl && \
    curl https://bootstrap.pypa.io/get-pip.py -o /tmp/get-pip.py && python3 /tmp/get-pip.py
