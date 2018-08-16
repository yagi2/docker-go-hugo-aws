
FROM golang:latest

ARG pip_installer="https://bootstrap.pypa.io/get-pip.py"

RUN set -x && \
    go get github.com/magefile/mage && \
    go get -d github.com/gohugoio/hugo && \
    cd ${GOPATH:-$HOME/go}/src/github.com/gohugoio/hugo && \
    mage vendor && \
    mage install
    
RUN apk --update add \
    python \
    curl \
    groff
    
RUN curl ${pip_installer} | python && \
    pip install awscli