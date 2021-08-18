FROM ubuntu:latest

WORKDIR /usr/src/app

# Install git
RUN apt-get -y update
RUN apt-get -y install git

# Clone only the project
RUN git init
RUN git remote add -f origin https://github.com/docker-hy/material-applications.git
RUN git config core.sparseCheckout true
RUN echo 'example-frontend' >> .git/info/sparse-checkout
RUN git pull origin main

# Install curl
RUN apt-get update && apt-get install -y curl
# Prepare to install NodeJS
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash
# Install NodeJS
RUN apt install -y nodejs
# Install serve
RUN npm install -g serve

# Build
WORKDIR /usr/src/app/example-frontend
RUN npm install && npm run build

# Run
CMD ["npx", "serve", "-s", "-l", "5000", "build"]
EXPOSE 5000