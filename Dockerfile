FROM odewahn/jem-docker-strata
MAINTAINER Andrew Odewahn "odewahn@oreilly.com"

RUN mkdir -p /atlas

ADD . /atlas
WORKDIR /atlas
EXPOSE 8080
