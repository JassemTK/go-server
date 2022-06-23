FROM golang:buster AS builder
WORKDIR /usr/app/
COPY hello.go  ./
RUN go mod init salut
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o app .
#from build phase get app only
FROM alpine:latest 
WORKDIR /usr/app/
COPY --from=builder /usr/app/app .
EXPOSE 8081
CMD ["./app"]
