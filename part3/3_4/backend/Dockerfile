FROM ubuntu:latest

WORKDIR /usr/src/app

RUN apt-get -y update && \
    apt-get -y install git && \
    git init && \
    git remote add -f origin https://github.com/docker-hy/material-applications.git && \
    git config core.sparseCheckout true && \
    echo 'example-backend' >> .git/info/sparse-checkout && \
    git pull origin main && \
    apt-get update && apt-get install -y wget && \
    apt-get install -y build-essential && \
    wget -c https://golang.org/dl/go1.16.7.linux-amd64.tar.gz && tar -C /usr/local -xzf go1.16.7.linux-amd64.tar.gz

ENV PATH /usr/local/go/bin:$PATH

WORKDIR /usr/src/app/example-backend

RUN go build && go test ./... && useradd -m appuser && \
    apt-get purge -y --auto-remove wget git build-essential && \ 
    rm -rf /var/lib/apt/lists/*

USER appuser

# Run
CMD ["./server"]
EXPOSE 8080