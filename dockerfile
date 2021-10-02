FROM golang:alpine as first

WORKDIR /go/src/app

COPY . .

RUN CGO_ENABLED=0 go build -o /app main.go

FROM scratch

COPY --from=first /app /app

CMD ["/app"]