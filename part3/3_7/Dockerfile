FROM alpine:latest as build

WORKDIR /usr/src/app

RUN apk add --no-cache git && \
    git clone https://github.com/robsondepaula/shell-guessing-game.git

FROM alpine:latest

WORKDIR /usr/src/app

COPY --from=build /usr/src/app/shell-guessing-game/guessinggame.sh ./guessinggame.sh

RUN adduser -D appuser && \
    chmod +x guessinggame.sh

USER appuser

ENTRYPOINT ["./guessinggame.sh"]