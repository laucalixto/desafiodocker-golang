FROM golang:alpine AS builder

RUN mkdir /src

COPY ./src /src

WORKDIR /src

RUN CGO_ENABLED=0 go build -ldflags="-s -w" -o main .

FROM scratch

COPY --from=builder /src /src

ENTRYPOINT ["/src/main"]