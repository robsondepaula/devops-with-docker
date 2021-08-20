FROM ubuntu:latest

WORKDIR /usr/src/app

RUN apt-get -y update && \
    apt-get -y install git && \
    git init && \
    git remote add -f origin https://github.com/docker-hy/material-applications.git && \
    git config core.sparseCheckout true && \
    echo 'example-frontend' >> .git/info/sparse-checkout && \
    git pull origin main && \
    apt-get update && apt-get install -y curl && \
    curl -fsSL https://deb.nodesource.com/setup_14.x | bash - && \
    apt install -y nodejs
    
WORKDIR /usr/src/app/example-frontend

RUN npm install && npm run build && npm install -g serve && useradd -m appuser && \
    apt-get purge -y --auto-remove curl git && \ 
    rm -rf /var/lib/apt/lists/*

USER appuser

CMD ["npx", "serve", "-s", "-l", "5000", "build"]
EXPOSE 5000