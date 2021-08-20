FROM golang:alpine

WORKDIR /usr/src/app

RUN apk add --no-cache git build-base && \
    git init && \
    git remote add -f origin https://github.com/docker-hy/material-applications.git && \
    git config core.sparseCheckout true && \
    echo 'example-backend' >> .git/info/sparse-checkout && \
    git pull origin main

WORKDIR /usr/src/app/example-backend

RUN go build && go test ./... && adduser -D appuser && \
    apk del git build-base

USER appuser

# Run
CMD ["./server"]
EXPOSE 8080