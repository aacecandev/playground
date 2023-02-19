# syntax=docker/dockerfile:1

# ------------------ BUILD STAGE ------------------

# FROM golang:1.18.0-alpine3.15 AS builder
FROM golang@sha256:7473adb02bd430045c938f61e2c2177ff62b28968579dfed99085a0960f76f5d AS builder

# Set build arguments
ARG CGO_ENABLED=0

# Set the Current Working Directory inside the container
WORKDIR /store

# Copy the go.mod and go.sum files
COPY go.mod go.sum /store/

# Download all dependencies. Dependencies will be cached if the go.mod and the go.sum files are not changed
RUN go mod download

# Copy the source from the current directory to the Working Directory inside the container
COPY . /store/

# Build the Go app
RUN go build -ldflags '-extldflags "-static"' -o main main.go

# ------------------ PRODUCTION STAGE ------------------

# FROM alpine:3.11
FROM alpine@sha256:93d5a28ff72d288d69b5997b8ba47396d2cbb62a72b5d87cd3351094b5d578a0

# Set build arguments
ARG UID=1001
ARG PORT=8080

# Set persistent environment variables
ENV TZ=Europe/Madrid
ENV USER=appuser

# Create a non-root user
RUN adduser --disabled-password --gecos "" --no-create-home --uid ${UID} ${USER} && \
      mkdir -p -mg=w /var/log/store

# Install certificates that we'll add to the production env
RUN apk --no-cache add \
      ca-certificates \tzdata

# Set the Current Working Directory inside the container
WORKDIR /store

# Copy the binary from the builder image
COPY --from=builder --chown=${USER}:0 /store /store/

# tells Docker that the container listens on specified network ports at runtime
EXPOSE ${PORT}

USER ${USER}

# Run the binary program produced by `go build`
ENTRYPOINT ["/store/main"]
