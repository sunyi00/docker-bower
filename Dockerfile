FROM debian:trusty

MAINTAINER "sunyi00" <sunyi00@gmail.com>

WORKDIR /tmp

RUN apt-get -y install software-properties-common && \
    apt-add-repository -y ppa:brightbox/ruby-ng && \
    apt-get update -y && \
    apt-get install -y ruby1.9.3 && \
    gem1.9.3 install bundler && \
    apt-get install -y ruby-switch && \
    ruby-switch --set ruby1.9.1 && \
    apt-get install -y curl git && \
    curl -sL https://deb.nodesource.com/setup | bash -  && \
    apt-get install -y nodejs  && \
    apt-get remove --purge curl -y  && \
    apt-get -y autoclean && \
    apt-get -y clean && \
    rm -rf /var/cache/apt/archives/* && \
    rm -rf /var/lib/apt/lists/* && \
    npm install -g bower && \
    npm install -g grunt && \
    npm install -g grunt-cli

RUN groupadd -g 1000 work && useradd work -u 1000 -g work -m -d /home/work -s /bin/bash
