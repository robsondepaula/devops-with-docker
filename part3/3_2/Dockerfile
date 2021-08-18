FROM ubuntu:latest

RUN apt-get -y update

RUN apt-get -y install apt-transport-https ca-certificates curl gnupg lsb-release tzdata

RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

RUN echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null

RUN apt-get -y update

RUN apt-get -y install docker-ce docker-ce-cli containerd.io

WORKDIR /app

COPY simple_build_server.sh .

RUN chmod +x simple_build_server.sh

ENV PATH /app:$PATH

ENTRYPOINT ["simple_build_server.sh"]