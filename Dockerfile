FROM golang:1.22.2-alpine AS builder

WORKDIR /go/src/executable

COPY . .

RUN go build -o /executable hello-golang.go

FROM scratch

COPY --from=builder /executable /executable

CMD ["/executable"]