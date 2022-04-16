FROM golang:buster AS builder
WORKDIR /usr/app/
COPY hello.go  ./
RUN go mod init salut
RUN go build

FROM alpine:latest 
WORKDIR /usr/app/
COPY --from=builder /usr/app/salut ./
EXPOSE 8081
CMD ["./salut"]
