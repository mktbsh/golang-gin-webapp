FROM golang:1.15.6-alpine AS builder
RUN mkdir /build
ADD go.mod go.sum main.go /build/
WORKDIR /build
RUN go build -o webapp

FROM alpine
RUN adduser -S -D -H -h /app appuser
USER appuser
COPY --from=builder /build/webapp /app/
COPY views/ /app/views
WORKDIR /app
CMD ["./webapp"]