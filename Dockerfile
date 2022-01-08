FROM ruby:3.1.0-buster

RUN apt-get update
RUN useradd buster && \
  mkdir /home/buster && \
  chown -R buster.buster /home/buster

USER buster
WORKDIR /home/buster
