FROM golang:alpine as build

WORKDIR /usr/src/app

RUN apk add --no-cache git build-base && \
    git init && \
    git remote add -f origin https://github.com/docker-hy/material-applications.git && \
    git config core.sparseCheckout true && \
    echo 'example-backend' >> .git/info/sparse-checkout && \
    git pull origin main

WORKDIR /usr/src/app/example-backend

RUN go build && go test ./... 

FROM alpine:latest

WORKDIR /usr/src/app

COPY --from=build /usr/src/app/example-backend/server ./server

RUN adduser -D appuser

USER appuser

# Run
CMD ["./server"]
EXPOSE 8080