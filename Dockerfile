FROM ubuntu:16.04

LABEL maintainer="Jaehyun Shin <keepcosmos@myrealtrip.com>"

RUN echo "apt-get update & upgrade"
RUN apt-get -y update >/dev/null 2>&1
RUN apt-get -y upgrade >/dev/null 2>&1

RUN apt-get install -y software-properties-common >/dev/null 2>&1
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10 >/dev/null 2>&1
RUN add-apt-repository -y ppa:webupd8team/java >/dev/null 2>&1
RUN apt-get install -y build-essential curl wget libsqlite3-dev libpq-dev git iputils-ping vim >/dev/null 2>&1
RUN apt-get -y update >/dev/null 2>&1
RUN echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections
RUN echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections
RUN apt-get install -y oracle-java8-installer >/dev/null 2>&1
RUN apt-get -y update && apt-get install -y nginx >/dev/null 2>&1

ENV LANG en_US.UTF-8
ENV JAVA_HOME /usr/lib/jvm/java-8-oracle
