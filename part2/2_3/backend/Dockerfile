FROM ubuntu:latest

WORKDIR /usr/src/app

# Install git
RUN apt-get -y update
RUN apt-get -y install git

# Clone only the project
RUN git init
RUN git remote add -f origin https://github.com/docker-hy/material-applications.git
RUN git config core.sparseCheckout true
RUN echo 'example-backend' >> .git/info/sparse-checkout
RUN git pull origin main

# Install wget
RUN apt-get update && apt-get install -y wget
# Prepare to install go
RUN apt-get install -y build-essential
# Download and install go
RUN wget -c https://golang.org/dl/go1.16.7.linux-amd64.tar.gz && tar -C /usr/local -xzf go1.16.7.linux-amd64.tar.gz

ENV PATH /usr/local/go/bin:$PATH

ENV REQUEST_ORIGIN=http://localhost:5000

# Build
WORKDIR /usr/src/app/example-backend
RUN go build

# Test
RUN go test ./...

# Run
CMD ["./server"]
EXPOSE 8080