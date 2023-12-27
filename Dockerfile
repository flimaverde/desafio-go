FROM golang:1.21-alpine as builder

WORKDIR /usr/src/app

COPY . .
RUN go build hello.go

FROM scratch
COPY --from=builder /usr/src/app .
ENTRYPOINT [ "./hello" ]