FROM golang:1.19.4-alpine AS build

WORKDIR /build

ENV GO111MODULE=on
ENV CGO_ENABLED=0

COPY . .

RUN go build

FROM scratch

WORKDIR /
COPY --from=build /build/playground-action /playground-action

ENV PATH /
ENTRYPOINT ["playground-action"]
