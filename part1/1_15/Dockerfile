FROM ubuntu:latest

WORKDIR /usr/src/app

# Install git
RUN apt-get -y update
RUN apt-get -y install git

# Clone only the project
RUN git clone https://github.com/robsondepaula/shell-guessing-game.git

# Build
WORKDIR /usr/src/app/shell-guessing-game

RUN chmod +x guessinggame.sh

# Run
ENTRYPOINT ["./guessinggame.sh"]
