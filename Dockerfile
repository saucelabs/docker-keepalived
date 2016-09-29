FROM ubuntu:14.04

MAINTAINER Saucelabs Automated Team

ENV KEEPALIVED_VERSION 1:1.2.23~ubuntu14.04.1

RUN \
    apt-get update && \
    apt-get install -y software-properties-common python-software-properties && \
    add-apt-repository -y ppa:keepalived/stable && \
    apt-get update && \
    apt-get install -y curl keepalived=$KEEPALIVED_VERSION && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY ./docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]
