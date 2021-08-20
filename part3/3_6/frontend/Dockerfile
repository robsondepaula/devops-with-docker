FROM node:alpine as build

WORKDIR /usr/src/app

RUN apk add --no-cache git && \
    git init && \
    git remote add -f origin https://github.com/docker-hy/material-applications.git && \
    git config core.sparseCheckout true && \
    echo 'example-frontend' >> .git/info/sparse-checkout && \
    git pull origin main
    
WORKDIR /usr/src/app/example-frontend

RUN npm install && npm run build 

FROM alpine:latest

WORKDIR /usr/src/app

RUN apk add --no-cache nodejs npm && npm install -g serve && adduser -D appuser

COPY --from=build /usr/src/app/example-frontend/build ./build

USER appuser

CMD ["npx", "serve", "-s", "-l", "5000", "build"]
EXPOSE 5000