FROM --platform=$BUILDPLATFORM golang:1.24-alpine AS builder
WORKDIR /app

# Improve caching for dependencies (handle missing go.sum)
COPY go.mod ./
RUN go mod download

# Copy source and build a per-arch binary
COPY . .
ARG TARGETOS TARGETARCH
RUN CGO_ENABLED=0 GOOS=$TARGETOS GOARCH=$TARGETARCH go build -o server ./api

FROM alpine:3.19
WORKDIR /app
COPY --from=builder /app/server .
EXPOSE 8080
CMD ["./server"]