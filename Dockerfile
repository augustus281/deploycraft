FROM golang:1.24-alpine AS builder
WORKDIR /app
COPY . .
RUN go build -o server ./api

FROM alpine:3.19
WORKDIR /app
COPY --from=builder /app/server .
EXPOSE 8080
CMD ["./server"]