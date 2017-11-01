FROM ubuntu:16.04

LABEL maintainer="Jaehyun Shin <keepcosmos@gmail.com>"

RUN echo "Installing essentials..."
RUN apt-get -y update >/dev/null 2>&1
RUN apt-get -y upgrade >/dev/null 2>&1

RUN apt-get install -y software-properties-common >/dev/null 2>&1
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10 >/dev/null 2>&1
RUN add-apt-repository -y ppa:webupd8team/java >/dev/null 2>&1
RUN apt-get install -y \
	build-essential \
	curl \
	wget \
	nginx \
	libsqlite3-dev \
	libpq-dev \
	git \
	iputils-ping \
	vim \
	>/dev/null 2>&1

RUN apt-get update -y >/dev/null 2>&1
RUN echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections
RUN echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections
RUN apt-get install -y oracle-java8-installer >/dev/null 2>&1

ENV LANG en_US.UTF-8
ENV JAVA_HOME /usr/lib/jvm/java-8-oracle

RUN apt-get install -y zsh
RUN wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh || true

CMD ["zsh"]
