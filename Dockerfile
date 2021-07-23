FROM golang:1.17rc1-alpine3.14 AS baseImage

# MAINTAINER is deprecated
LABEL MAINTAINER="Fábio Jânio <fabiojaniolima@gmail.com>"

COPY main.go .
RUN go build main.go

WORKDIR /go

FROM scratch

COPY --from=baseImage /go .

CMD ["/main"]