FROM ubuntu:latest

RUN apt-get update && apt-get install -y git && apt-get install -y openjdk-11-jdk && apt-get install -y maven

WORKDIR /git-clone

RUN git clone https://github.com/Bhargavi-lakamsani/war-web-project.git

WORKDIR /git-clone/war-web-project

RUN mvn clean package
