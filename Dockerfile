FROM ubuntu:latest

RUN apt-get update && apt-get install -y git && apt-get install -y openjdk-11-jdk && apt-get install -y maven

WORKDIR /git-clone

RUN git clone https://github.com/Bhargavi-lakamsani/hello-world-war.git

WORKDIR /git-clone/hello-world-war

RUN mvn clean package
