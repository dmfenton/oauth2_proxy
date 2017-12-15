FROM golang:1.9-alpine
MAINTAINER colin.hom@coreos.com

RUN apk add --no-cache git

RUN go get -u github.com/golang/dep/cmd/dep

ADD . $GOPATH/src/github.com/bitly/oauth2_proxy

WORKDIR $GOPATH/src/github.com/bitly/oauth2_proxy

RUN dep ensure

RUN go build

RUN mv oauth2_proxy /usr/local/bin

ENTRYPOINT ["oauth2_proxy"]
