FROM openjdk:8

WORKDIR /usr/src/app

# Install git
RUN apt-get -y update
RUN apt-get -y install git

# Clone only the project
RUN git init
RUN git remote add -f origin https://github.com/docker-hy/material-applications.git
RUN git config core.sparseCheckout true
RUN echo 'spring-example-project' >> .git/info/sparse-checkout
RUN git pull origin main

# Build
WORKDIR /usr/src/app/spring-example-project
RUN ./mvnw package

# Run
CMD ["java", "-jar", "./target/docker-example-1.1.3.jar"]
EXPOSE 8080