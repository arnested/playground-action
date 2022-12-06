FROM golang:1.19.4 AS build


ENV GOPATH ''
RUN go env

ADD . /go

RUN (cd cmd/main && go build)

FROM scratch

WORKDIR /
COPY --from=build /go/cmd/main/main /main

ENV PATH /
ENTRYPOINT ["main"]
